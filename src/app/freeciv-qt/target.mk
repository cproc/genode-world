TARGET = freeciv-qt

FREECIV_DIR := $(call select_from_ports,freeciv)/src/app/freeciv

CLIENT_SRC_C = \
	gui_interface.c

GUI_QT_SRC_CC = \
	canvas.cpp \
	chatline.cpp \
	citydlg.cpp \
	cityrep.cpp \
	colors.cpp \
	connectdlg.cpp \
	dialogs.cpp \
	diplodlg.cpp \
	fc_client.cpp \
	finddlg.cpp \
	gotodlg.cpp \
	graphics.cpp \
	gui_main.cpp \
	helpdlg.cpp \
	inteldlg.cpp \
	luaconsole.cpp \
	mapctrl.cpp \
	mapview.cpp \
	menu.cpp \
	messagedlg.cpp \
	messagewin.cpp \
	optiondlg.cpp \
	pages.cpp \
	plrdlg.cpp \
	qtg_cxxside.cpp \
	ratesdlg.cpp \
	repodlgs.cpp \
	spaceshipdlg.cpp \
	sprite.cpp \
	themes.cpp \
	voteinfo_bar.cpp \
	wldlg.cpp \
	moc_fc_client.cpp \
	moc_helpdlg.cpp \
	moc_ratesdlg.cpp \
	moc_mapview.cpp \
	moc_menu.cpp \
	moc_repodlgs.cpp \
	moc_dialogs.cpp \
	moc_optiondlg.cpp \
	moc_citydlg.cpp \
	moc_cityrep.cpp \
	moc_plrdlg.cpp \
	moc_diplodlg.cpp \
	moc_spaceshipdlg.cpp \
	moc_messagewin.cpp \
	moc_chatline.cpp \
	moc_messagedlg.cpp \
	moc_voteinfo_bar.cpp \
	moc_gotodlg.cpp

SRC_C  = $(CLIENT_SRC_C)
SRC_CC = $(GUI_QT_SRC_CC)

INC_DIR += $(FREECIV_DIR)/client \
           $(FREECIV_DIR)/client/agents \
           $(FREECIV_DIR)/client/include \
           $(FREECIV_DIR)/client/luascript \
           $(FREECIV_DIR)/common \
           $(FREECIV_DIR)/common/aicore \
           $(FREECIV_DIR)/common/scriptcore \
           $(FREECIV_DIR)/dependencies/cvercmp \
           $(FREECIV_DIR)/dependencies/lua-5.2/src \
           $(FREECIV_DIR)/dependencies/tolua-5.2/include \
           $(FREECIV_DIR)/utility

LIBS = freeciv-client freeciv libiconv zlib qt5_widgets qt5_qpa_nitpicker qt5_gui qt5_core qt5_component sdl libc_resolv vfs_lxip

vpath % $(FREECIV_DIR)/client/gui-qt
vpath % $(FREECIV_DIR)/client

$(TARGET): freeciv_data.tar
freeciv_data.tar:
	$(VERBOSE)cd $(FREECIV_DIR); tar cf $(PWD)/bin/$@ data
