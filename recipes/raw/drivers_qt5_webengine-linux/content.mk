content: drivers.config event_filter.config en_us.chargen special.chargen

drivers.config event_filter.config:
	cp $(REP_DIR)/recipes/raw/drivers_qt5_webengine-linux/$@ $@

en_us.chargen special.chargen:
	cp $(GENODE_DIR)/repos/os/src/server/event_filter/$@ $@
