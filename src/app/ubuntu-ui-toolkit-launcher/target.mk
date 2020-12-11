include $(call select_from_repositories,lib/import/import-ubuntu-ui-toolkit.mk)

QMAKE_PROJECT_FILE = $(UBUNTU_UI_TOOLKIT_PORT_DIR)/ubuntu-ui-toolkit-launcher/ubuntu-ui-toolkit-launcher.pro

QMAKE_TARGET_BINARIES = ubuntu-ui-toolkit-launcher

QT5_PORT_LIBS = libQt5Core libQt5Gui libQt5Network libQt5Svg libQt5Test libQt5Widgets
QT5_PORT_LIBS += libQt5Qml libQt5Quick

LIBS = libc libm mesa qt5_component stdcxx ubuntu-ui-toolkit $(QT5_PORT_LIBS)

include $(call select_from_repositories,lib/import/import-qt5_qmake.mk)
