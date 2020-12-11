include $(call select_from_repositories,lib/import/import-ubuntu-ui-toolkit.mk)

QMAKE_PROJECT_FILE = $(UBUNTU_UI_TOOLKIT_PORT_DIR)/ubuntu-ui-toolkit-launcher/ubuntu-ui-toolkit-launcher.pro

QMAKE_TARGET_BINARIES = ubuntu-ui-toolkit-launcher

QT5_PORT_LIBS = libQt5Core libQt5Gui libQt5Network libQt5Svg libQt5Test libQt5Widgets
QT5_PORT_LIBS += libQt5Qml libQt5Quick

LIBS = libc libm mesa qt5_component stdcxx ubuntu-ui-toolkit $(QT5_PORT_LIBS)

include $(call select_from_repositories,lib/import/import-qt5_qmake.mk)

#
# create tar archive for gallery data
#

GALLERY_TAR = $(BUILD_BASE_DIR)/bin/ubuntu-ui-toolkit-gallery.tar

$(GALLERY_TAR): $(UBUNTU_UI_TOOLKIT_PORT_DIR)/examples/ubuntu-ui-toolkit-gallery
	$(VERBOSE)tar cf $@ -C $(UBUNTU_UI_TOOLKIT_PORT_DIR)/examples ubuntu-ui-toolkit-gallery


UNIT_CONVERTER_TAR = $(BUILD_BASE_DIR)/bin/ubuntu-ui-toolkit-unit-converter.tar

$(UNIT_CONVERTER_TAR): $(UBUNTU_UI_TOOLKIT_PORT_DIR)/examples/unit-converter
	$(VERBOSE)tar cf $@ -C $(UBUNTU_UI_TOOLKIT_PORT_DIR)/examples unit-converter


$(TARGET): $(GALLERY_TAR) $(UNIT_CONVERTER_TAR)


clean:
	$(VERBOSE)rm $(GALLERY_TAR)
