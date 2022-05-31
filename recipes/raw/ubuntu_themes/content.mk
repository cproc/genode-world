content: ubuntu-themes.tar

PORT_DIR := $(call port_dir,$(REP_DIR)/ports/ubuntu-themes)

ubuntu-themes.tar:
	tar --mtime='2021-04-29 00:00Z' \
	    -cf $@ \
	    --transform='s/ubuntu-themes/usr\/share\/icons/' \
	    --transform='s/suru-icons/suru/' \
	    -C $(PORT_DIR) \
	    ubuntu-themes/suru-icons \
	    ubuntu-themes/ubuntu-mobile
