################################################################################
#
# PX68K
#
################################################################################
LIBRETRO_PX68K_VERSION = 16d59eb96e239b4fe31796df197506a7b73511c4
LIBRETRO_PX68K_SITE = $(call github,libretro,px68k-libretro,$(LIBRETRO_PX68K_VERSION))
LIBRETRO_PX68K_LICENSE = Unknown

define LIBRETRO_PX68K_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_PX68K_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/px68k_libretro.so \
	  $(TARGET_DIR)/usr/lib/libretro/px68k_libretro.so

	# Bios
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/keropi
	echo "[WinX68k]" > $(TARGET_DIR)/usr/share/batocera/datainit/bios/keropi/config
	echo "StartDir=/userdata/roms/x68000/" >> $(TARGET_DIR)/usr/share/batocera/datainit/bios/keropi/config
endef

$(eval $(generic-package))
