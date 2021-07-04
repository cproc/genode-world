MIRROR_FROM_REP_DIR = lib/mk/libsndio.mk

content: $(MIRROR_FROM_REP_DIR)

$(MIRROR_FROM_REP_DIR):
	$(mirror_from_rep_dir)

MIRROR_FROM_PORT_DIR = src/lib/sndio

content: $(MIRROR_FROM_PORT_DIR)

PORT_DIR := $(call port_dir,$(REP_DIR)/ports/sndio)

$(MIRROR_FROM_PORT_DIR):
	mkdir -p $(dir $@)
	cp -r $(PORT_DIR)/$@ $(dir $@)

content: src/lib/sndio/target.mk \
         LICENSE

src/lib/sndio/target.mk:
	mkdir -p $(dir $@)
	echo "LIBS = libsndio" > $@

LICENSE:
	echo "sndio is subject to the license specified in the source files" > $@
