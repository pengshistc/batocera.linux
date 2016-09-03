################################################################################
#
# FBA
#
################################################################################
LIBRETRO_FBA_VERSION = ab2c68588ef1d0ce2e2fbb3017a5f0763ea3d472
LIBRETRO_FBA_SITE = $(call github,libretro,fbalpha,$(LIBRETRO_FBA_VERSION))

ifeq ($(BR2_cortex_a7),y)
	LIBRETRO_FBA_PLATFORM=rpi2
else
	LIBRETRO_FBA_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_FBA_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f makefile.libretro platform="$(LIBRETRO_FBA_PLATFORM)" profile="performance"
endef

define LIBRETRO_FBA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/fba_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fba_libretro.so
endef

$(eval $(generic-package))
