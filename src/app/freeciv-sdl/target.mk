TARGET = freeciv-sdl

FREECIV_DIR := $(call select_from_ports,freeciv)/src/app/freeciv

GUI_SDL_SRC_C = \
	alphablit.c \
	canvas.c \
	caravan_dialog.c \
	chatline.c \
	citydlg.c \
	cityrep.c \
	cma_fe.c \
	colors.c \
	connectdlg.c \
	dialogs.c \
	diplodlg.c \
	diplomat_dialog.c \
	finddlg.c \
	gotodlg.c \
	graphics.c \
	gui_iconv.c \
	gui_main.c \
	gui_mouse.c \
	gui_string.c \
	gui_tilespec.c \
	happiness.c \
	helpdlg.c \
	inputdlg.c \
	inteldlg.c \
	luaconsole.c \
	mapctrl.c \
	mapview.c \
	menu.c \
	messagedlg.c \
	messagewin.c \
	optiondlg.c \
	pages.c \
	plrdlg.c \
	repodlgs.c \
	spaceshipdlg.c \
	sprite.c \
	themebackgrounds.c \
	themecolors.c \
	themes.c \
	themespec.c \
	unistring.c \
	voteinfo_bar.c \
	widget.c \
	widget_button.c \
	widget_checkbox.c \
	widget_combo.c \
	widget_core.c \
	widget_edit.c \
	widget_icon.c \
	widget_label.c \
	widget_scrollbar.c \
	widget_window.c \
	wldlg.c

SRC_C = $(GUI_SDL_SRC_C)

INC_DIR += $(FREECIV_DIR)/utility \
           $(FREECIV_DIR)/client \
           $(FREECIV_DIR)/client/agents \
           $(FREECIV_DIR)/client/include \
           $(FREECIV_DIR)/client/luascript \
           $(FREECIV_DIR)/common \
           $(FREECIV_DIR)/common/aicore \
           $(FREECIV_DIR)/common/scriptcore \
           $(FREECIV_DIR)/dependencies/cvercmp \
           $(FREECIV_DIR)/dependencies/lua-5.2/src \
           $(FREECIV_DIR)/dependencies/tolua-5.2/include

INC_DIR += $(call select_from_ports,sdl_ttf)/include/SDL

LIBS = freeciv libiconv libc sdl zlib sdl_ttf sdl_gfx sdl_image freeciv-client posix libc_resolv vfs_lxip

vpath %.c $(FREECIV_DIR)/client/gui-sdl

$(TARGET): freeciv_data.tar
freeciv_data.tar:
	$(VERBOSE)cd $(FREECIV_DIR); tar cf $(PWD)/bin/$@ data
