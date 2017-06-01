FREECIV_DIR := $(call select_from_ports,freeciv)/src/app/freeciv

CLIENT_SRC_C = \
        client/attribute.c \
        client/audio_sdl.c \
        client/citydlg_common.c \
        client/cityrepdata.c \
        client/client_main.c \
        client/chatline_common.c \
        client/connectdlg_common.c \
        client/climisc.c \
        client/climap.c \
        client/clinet.c \
        client/colors_common.c \
        client/control.c \
        client/editor.c \
        client/ggzclient.c \
        client/global_worklist.c \
        client/goto.c \
        client/helpdata.c \
        client/luaconsole_common.c \
        client/mapctrl_common.c \
        client/mapview_common.c \
        client/messagewin_common.c \
        client/overview_common.c \
        client/packhand.c \
        client/packhand_gen.c \
        client/plrdlg_common.c \
        client/options.c \
        client/repodlgs_common.c \
        client/reqtree.c \
        client/servers.c \
        client/text.c \
        client/themes_common.c \
        client/tilespec.c \
        client/unitselect_common.c \
        client/update_queue.c \
        client/voteinfo.c \
        client/audio.c \
        client/audio_none.c

AGENTS_SRC_C = \
        client/agents/agents.c \
        client/agents/cma_core.c \
        client/agents/cma_fec.c \
        client/agents/sha.c

LUASCRIPT_SRC_C = \
        client/luascript/api_client_base.c \
        client/luascript/script_client.c \
        client/luascript/tolua_client_gen.c

SRC_C = $(CLIENT_SRC_C) \
        $(AGENTS_SRC_C) \
        $(LUASCRIPT_SRC_C)

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

LIBS = freeciv libiconv libc zlib sdl sdl_mixer

vpath %c $(FREECIV_DIR)
