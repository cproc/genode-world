INC_DIR += $(REP_DIR)/include/freeciv

CC_OPT += -DHAVE_CONFIG_H \
          -DLOCALEDIR=\"/data/locale\" \
          -DBINDIR=\"/freeciv/bin\" \
          -DFC_CONF_PATH=\"/freeciv/etc/freeciv\" \
          -DDEFAULT_DATA_PATH=\"/data\" \
          -DDEFAULT_SAVE_PATH=\"/freeciv/saves\" \
          -DDEFAULT_SCENARIO_PATH=\"/data/scenarios\"
