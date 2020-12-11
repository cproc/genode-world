include $(call select_from_repositories,lib/import/import-qt5_qmake.mk)

PORT_DIR := $(call select_from_ports,ubuntu-ui-toolkit)/src/lib/ubuntu-ui-toolkit

QT5_PORT_LIBS += libQt5Core libQt5Gui libQt5Network libQt5Test libQt5Widgets
QT5_PORT_LIBS += libQt5Qml libQt5Quick
QT5_PORT_LIBS += libQt5Svg

LIBS = libc libm mesa stdcxx $(QT5_PORT_LIBS)

built.tag: qmake_prepared.tag

	@#
	@# run qmake
	@#

	$(VERBOSE)source env.sh && $(QMAKE) \
		-qtconf qmake_root/mkspecs/$(QMAKE_PLATFORM)/qt.conf \
		$(PORT_DIR)/ubuntu-sdk.pro \
		$(QT5_OUTPUT_FILTER)

	@#
	@# build
	@#

	$(VERBOSE)source env.sh && $(MAKE) sub-src $(QT5_OUTPUT_FILTER)

	@#
	@# install into local 'install' directory
	@#

	$(VERBOSE)$(MAKE) INSTALL_ROOT=$(CURDIR)/install sub-src-install_subtargets $(QT5_OUTPUT_FILTER)

	$(VERBOSE)ln -sf .$(CURDIR)/qmake_root install/qt

	@#
	@# create stripped versions
	@#

	$(VERBOSE)cd $(CURDIR)/install/qt/lib && \
		$(STRIP) libUbuntuGestures.lib.so -o libUbuntuGestures.lib.so.stripped && \
		$(STRIP) libUbuntuMetrics.lib.so -o libUbuntuMetrics.lib.so.stripped && \
		$(STRIP) libUbuntuToolkit.lib.so -o libUbuntuToolkit.lib.so.stripped

	$(VERBOSE)cd $(CURDIR)/install/qt/qml/Ubuntu/Components && \
		$(STRIP) libUbuntuComponents.lib.so -o libUbuntuComponents.lib.so.stripped

	$(VERBOSE)cd $(CURDIR)/install/qt/qml/Ubuntu/Components/Labs && \
		$(STRIP) libUbuntuComponentsLabs.lib.so -o libUbuntuComponentsLabs.lib.so.stripped

	$(VERBOSE)cd $(CURDIR)/install/qt/qml/Ubuntu/Components/Styles && \
		$(STRIP) libUbuntuComponentsStyles.lib.so -o libUbuntuComponentsStyles.lib.so.stripped

	@#
	@# create symlinks in 'bin' directory
	@#

	$(VERBOSE)ln -sf $(CURDIR)/install/qt/lib/libUbuntuGestures.lib.so.stripped $(PWD)/bin/libUbuntuGestures.lib.so
	$(VERBOSE)ln -sf $(CURDIR)/install/qt/lib/libUbuntuMetrics.lib.so.stripped $(PWD)/bin/libUbuntuMetrics.lib.so
	$(VERBOSE)ln -sf $(CURDIR)/install/qt/lib/libUbuntuToolkit.lib.so.stripped $(PWD)/bin/libUbuntuToolkit.lib.so

	$(VERBOSE)ln -sf $(CURDIR)/install/qt/qml/Ubuntu/Components/libUbuntuComponents.lib.so.stripped $(PWD)/bin/libUbuntuComponents.lib.so
	$(VERBOSE)ln -sf $(CURDIR)/install/qt/qml/Ubuntu/Components/Labs/libUbuntuComponentsLabs.lib.so.stripped $(PWD)/bin/libUbuntuComponentsLabs.lib.so
	$(VERBOSE)ln -sf $(CURDIR)/install/qt/qml/Ubuntu/Components/Styles/libUbuntuComponentsStyles.lib.so.stripped $(PWD)/bin/libUbuntuComponentsStyles.lib.so

	@#
	@# create symlinks in 'debug' directory
	@#

	$(VERBOSE)ln -sf $(CURDIR)/install/qt/lib/libUbuntuGestures.lib.so $(PWD)/debug/
	$(VERBOSE)ln -sf $(CURDIR)/install/qt/lib/libUbuntuMetrics.lib.so $(PWD)/debug/
	$(VERBOSE)ln -sf $(CURDIR)/install/qt/lib/libUbuntuToolkit.lib.so $(PWD)/debug/

	$(VERBOSE)ln -sf $(CURDIR)/install/qt/qml/Ubuntu/Components/libUbuntuComponents.lib.so $(PWD)/debug/
	$(VERBOSE)ln -sf $(CURDIR)/install/qt/qml/Ubuntu/Components/Labs/libUbuntuComponentsLabs.lib.so $(PWD)/debug/
	$(VERBOSE)ln -sf $(CURDIR)/install/qt/qml/Ubuntu/Components/Styles/libUbuntuComponentsStyles.lib.so $(PWD)/debug/

	@#
	@# create tar archives
	@#

	$(VERBOSE)tar chf $(PWD)/bin/ubuntu-ui-toolkit_qml.tar --exclude='*.lib.so*' -C install qt/qml

	@#
	@# mark as done
	@#

	$(VERBOSE)touch $@


ifeq ($(called_from_lib_mk),yes)
all: built.tag
endif
