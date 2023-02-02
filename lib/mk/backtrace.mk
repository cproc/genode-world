LIBS = libbacktrace

LIBBACKTRACE_A := $(LIB_CACHE_DIR)/libbacktrace/.libs/libbacktrace.a

finished.tag: backtrace.lib.a
	@$(MSG_INST)$<
	$(VERBOSE)ln -sf $(LIBBACKTRACE_A) $<
	@touch $@

ifeq ($(called_from_lib_mk),yes)
all: finished.tag
endif
