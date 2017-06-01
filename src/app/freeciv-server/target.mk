TARGET = freeciv-server

FREECIV_DIR := $(call select_from_ports,freeciv)/src/app/freeciv

DEFAULTAI_SRC_C = \
        ai/default/advdomestic.c \
        ai/default/advmilitary.c \
        ai/default/advdiplomacy.c \
        ai/default/aiair.c \
        ai/default/aicity.c \
        ai/default/aidata.c \
        ai/default/aiferry.c \
        ai/default/aiguard.c \
        ai/default/aihand.c \
        ai/default/aihunt.c \
        ai/default/ailog.c \
        ai/default/aiparatrooper.c \
        ai/default/aiplayer.c \
        ai/default/aisettler.c \
        ai/default/aitech.c \
        ai/default/aitools.c \
        ai/default/aiunit.c \
        ai/default/aidiplomat.c

CLASSICAI_SRC_C = \
        ai/classic/classicai.c

AICOMMON_SRC_C = \
        ai/aitraits.c

ADVISORS_SRC_C = \
        server/advisors/advbuilding.c \
        server/advisors/advcity.c \
        server/advisors/advdata.c \
        server/advisors/advgoto.c \
        server/advisors/advruleset.c \
        server/advisors/advspace.c \
        server/advisors/advtools.c \
        server/advisors/autoexplorer.c \
        server/advisors/autosettlers.c \
        server/advisors/infracache.c

GENERATOR_SRC_C = \
        server/generator/mapgen.c \
        server/generator/mapgen_topology.c \
        server/generator/utilities.c \
        server/generator/height_map.c \
        server/generator/startpos.c \
        server/generator/temperature_map.c

SCRIPTING_FCDB_SRC_C = \
        server/scripting/api_fcdb_auth.c \
        server/scripting/api_fcdb_base.c \
        server/scripting/script_fcdb.c \
        server/scripting/tolua_fcdb_gen.c

SCRIPTING_SERVER_SRC_C = \
        server/scripting/api_server_base.c \
        server/scripting/api_server_edit.c \
        server/scripting/api_server_notify.c \
        server/scripting/script_server.c \
        server/scripting/tolua_server_gen.c

SERVER_SRC_C = \
        server/aiiface.c \
        server/auth.c \
        server/barbarian.c \
        server/citizenshand.c \
        server/cityhand.c \
        server/citytools.c \
        server/cityturn.c \
        server/civserver.c \
        server/commands.c \
        server/connecthand.c \
        server/console.c \
        server/diplhand.c \
        server/diplomats.c \
        server/edithand.c \
        server/fcdb.c \
        server/gamehand.c \
        server/ggzserver.c \
        server/handchat.c \
        server/hand_gen.c \
        server/maphand.c \
        server/meta.c \
        server/notify.c \
        server/plrhand.c \
        server/report.c \
        server/rssanity.c \
        server/ruleset.c \
        server/sanitycheck.c \
        server/savegame.c \
        server/savegame2.c \
        server/score.c \
        server/sernet.c \
        server/settings.c \
        server/spacerace.c \
        server/srv_log.c \
        server/srv_main.c \
        server/stdinhand.c \
        server/techtools.c \
        server/unithand.c \
        server/unittools.c \
        server/voting.c

SRC_C = \
        $(DEFAULTAI_SRC_C) \
        $(CLASSICAI_SRC_C) \
        $(AICOMMON_SRC_C) \
        $(ADVISORS_SRC_C) \
        $(GENERATOR_SRC_C) \
        $(SCRIPTING_FCDB_SRC_C) \
        $(SCRIPTING_SERVER_SRC_C) \
        $(SERVER_SRC_C)

SRC_CC = stack_size.cc

INC_DIR += \
           $(FREECIV_DIR)/ai \
           $(FREECIV_DIR)/ai/classic \
           $(FREECIV_DIR)/ai/default \
           $(FREECIV_DIR)/common \
           $(FREECIV_DIR)/common/aicore \
           $(FREECIV_DIR)/common/scriptcore \
           $(FREECIV_DIR)/dependencies/cvercmp \
           $(FREECIV_DIR)/dependencies/lua-5.2/src \
           $(FREECIV_DIR)/dependencies/tolua-5.2/include \
           $(FREECIV_DIR)/server \
           $(FREECIV_DIR)/server/advisors \
           $(FREECIV_DIR)/server/generator \
           $(FREECIV_DIR)/server/scripting \
           $(FREECIV_DIR)/utility

CC_OPT += -DSIGABRT=6

LIBS = freeciv libiconv libc zlib posix libc_resolv pthread vfs_lxip

vpath stack_size.cc $(PRG_DIR)
vpath %.c           $(FREECIV_DIR)

$(TARGET): freeciv_data.tar
freeciv_data.tar:
	$(VERBOSE)cd $(FREECIV_DIR); tar cf $(PWD)/bin/$@ data
