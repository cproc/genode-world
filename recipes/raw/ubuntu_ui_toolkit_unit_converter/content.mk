content: ubuntu_ui_toolkit_unit_converter.tar

PORT_DIR := $(call port_dir,$(REP_DIR)/ports/ubuntu-ui-toolkit)

ubuntu_ui_toolkit_unit_converter.tar:
	tar --mtime='2021-04-29 00:00Z' \
	    -cf $@ \
	    -C $(PORT_DIR)/src/lib/ubuntu-ui-toolkit/examples \
	    unit-converter
