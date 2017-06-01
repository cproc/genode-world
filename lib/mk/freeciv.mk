include $(REP_DIR)/lib/import/import-freeciv.mk

FREECIV_DIR := $(call select_from_ports,freeciv)/src/app/freeciv

LUA_SRC_C = \
        dependencies/lua-5.2/src/lapi.c \
        dependencies/lua-5.2/src/lauxlib.c \
        dependencies/lua-5.2/src/lbaselib.c \
        dependencies/lua-5.2/src/lbitlib.c \
        dependencies/lua-5.2/src/lcode.c \
        dependencies/lua-5.2/src/lcorolib.c \
        dependencies/lua-5.2/src/lctype.c \
        dependencies/lua-5.2/src/ldblib.c \
        dependencies/lua-5.2/src/ldebug.c \
        dependencies/lua-5.2/src/ldo.c \
        dependencies/lua-5.2/src/ldump.c \
        dependencies/lua-5.2/src/lfunc.c \
        dependencies/lua-5.2/src/lgc.c \
        dependencies/lua-5.2/src/linit.c \
        dependencies/lua-5.2/src/liolib.c \
        dependencies/lua-5.2/src/llex.c \
        dependencies/lua-5.2/src/lmathlib.c \
        dependencies/lua-5.2/src/lmem.c \
        dependencies/lua-5.2/src/loadlib.c \
        dependencies/lua-5.2/src/lobject.c \
        dependencies/lua-5.2/src/lopcodes.c \
        dependencies/lua-5.2/src/loslib.c \
        dependencies/lua-5.2/src/lparser.c \
        dependencies/lua-5.2/src/lstate.c \
        dependencies/lua-5.2/src/lstring.c \
        dependencies/lua-5.2/src/lstrlib.c \
        dependencies/lua-5.2/src/ltable.c \
        dependencies/lua-5.2/src/ltablib.c \
        dependencies/lua-5.2/src/ltm.c \
        dependencies/lua-5.2/src/lundump.c \
        dependencies/lua-5.2/src/lvm.c \
        dependencies/lua-5.2/src/lzio.c

TOLUA_SRC_C = \
        dependencies/tolua-5.2/src/lib/tolua_event.c \
        dependencies/tolua-5.2/src/lib/tolua_is.c \
        dependencies/tolua-5.2/src/lib/tolua_map.c \
        dependencies/tolua-5.2/src/lib/tolua_push.c \
        dependencies/tolua-5.2/src/lib/tolua_to.c

CVERCMP_SRC_C = \
        dependencies/cvercmp/cvercmp.c

UTILITY_SRC_C = \
        utility/astring.c \
        utility/bitvector.c \
        utility/capability.c \
        utility/distribute.c \
        utility/fc_utf8.c \
        utility/fcbacktrace.c \
        utility/fciconv.c \
        utility/fcintl.c \
        utility/fcthread.c \
        utility/genhash.c \
        utility/genlist.c \
        utility/inputfile.c \
        utility/ioz.c \
        utility/iterator.c \
        utility/log.c \
        utility/netfile.c \
        utility/netintf.c \
        utility/mem.c \
        utility/rand.c \
        utility/registry.c \
        utility/registry_ini.c \
        utility/section_file.c \
        utility/shared.c \
        utility/string_vector.c \
        utility/support.c \
        utility/timing.c \
        utility/md5.c

AICORE_SRC_C = \
        common/aicore/aisupport.c \
        common/aicore/path_finding.c \
        common/aicore/pf_tools.c \
        common/aicore/cm.c \
        common/aicore/citymap.c \
        common/aicore/caravan.c

SCRIPTCORE_SRC_C = \
        common/scriptcore/api_common_intl.c \
        common/scriptcore/api_common_utilities.c \
        common/scriptcore/api_game_effects.c \
        common/scriptcore/api_game_find.c \
        common/scriptcore/api_game_methods.c \
        common/scriptcore/api_game_specenum.c \
        common/scriptcore/api_signal_base.c \
        common/scriptcore/luascript.c \
        common/scriptcore/luascript_func.c \
        common/scriptcore/luascript_signal.c \
        common/scriptcore/tolua_common_a_gen.c \
        common/scriptcore/tolua_common_z_gen.c \
        common/scriptcore/tolua_game_gen.c \
        common/scriptcore/tolua_signal_gen.c

COMMON_SRC_C = \
        common/ai.c \
        common/base.c \
        common/borders.c \
        common/capstr.c \
        common/citizens.c \
        common/city.c \
        common/combat.c \
        common/connection.c \
        common/dataio.c \
        common/diptreaty.c \
        common/disaster.c \
        common/effects.c \
        common/events.c \
        common/featured_text.c \
        common/fc_cmdhelp.c \
        common/fc_interface.c \
        common/game.c \
        common/government.c \
        common/idex.c \
        common/improvement.c \
        common/map.c \
        common/mapimg.c \
        common/movement.c \
        common/nation.c \
        common/packets.c \
        common/packets_gen.c \
        common/player.c \
        common/requirements.c \
        common/research.c \
        common/rgbcolor.c \
        common/road.c \
        common/spaceship.c \
        common/specialist.c \
        common/team.c \
        common/tech.c \
        common/terrain.c \
        common/tile.c \
        common/traderoutes.c \
        common/unit.c \
        common/unitlist.c \
        common/unittype.c \
        common/vision.c \
        common/workertask.c \
        common/worklist.c \
        common/version.c

SRC_C = \
        $(LUA_SRC_C) \
        $(TOLUA_SRC_C) \
        $(CVERCMP_SRC_C) \
        $(UTILITY_SRC_C) \
        $(AICORE_SRC_C) \
        $(SCRIPTCORE_SRC_C) \
        $(COMMON_SRC_C)

INC_DIR += \
           $(FREECIV_DIR)/common \
           $(FREECIV_DIR)/common/aicore \
           $(FREECIV_DIR)/common/scriptcore \
           $(FREECIV_DIR)/dependencies/cvercmp \
           $(FREECIV_DIR)/dependencies/lua-5.2/src \
           $(FREECIV_DIR)/dependencies/tolua-5.2/include \
           $(FREECIV_DIR)/utility

LIBS = libiconv libc zlib curl

vpath %c $(FREECIV_DIR)
