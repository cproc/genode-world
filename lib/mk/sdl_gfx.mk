include $(REP_DIR)/lib/import/import-sdl_gfx.mk

SDL_GFX_PORT_DIR := $(call select_from_ports,sdl_gfx)

SRC_C = $(notdir $(wildcard $(SDL_GFX_PORT_DIR)/src/lib/sdl_gfx/*.c))

LIBS += sdl libc

vpath %.c $(SDL_GFX_PORT_DIR)/src/lib/sdl_gfx

SHARED_LIB = yes
