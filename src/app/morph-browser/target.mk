MORPH_BROWSER_PORT_DIR = $(call select_from_ports,morph-browser)/src/app/morph-browser

CMAKE_LISTS_DIR = $(MORPH_BROWSER_PORT_DIR)

#CMAKE_TARGET_BINARIES = test-qt_core

QT5_PORT_LIBS = libQt5Core libQt5Gui libQt5Widgets libQt5Network libQt5Sql
QT5_PORT_LIBS += libQt5Qml libQt5Quick
QT5_PORT_LIBS += libQt5WebEngineCore libQt5WebEngine libQt5WebChannel

LIBS = libc libm qt5_component stdcxx nss3 $(QT5_PORT_LIBS)

include $(call select_from_repositories,lib/import/import-qt5_cmake.mk)

cmake_prepared.tag: cmake_root/lib/nss3.lib.so
