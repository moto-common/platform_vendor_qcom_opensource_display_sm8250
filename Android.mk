ifneq ($(filter 4.19, $(TARGET_KERNEL_VERSION)),)

sdm-libs := sdm/libs
display-hals := include $(sdm-libs)/utils $(sdm-libs)/core libdebug gpu_tonemapper

ifneq ($(TARGET_IS_HEADLESS), true)
    display-hals += libcopybit liblight libmemtrack hdmi_cec \
                    libdrmutils libhistogram drm.vendor
endif

display-hals += gralloc
display-hals += sde-drm
display-hals += composer
display-hals += init

include $(call all-named-subdir-makefiles,$(display-hals))
endif
