> [!CAUTION]
> Currently, this device tree does NOT produce a working build of TWRP.
>   
> See [TWRP Build Issues](#twrp-build-issues)
>  
> This is my first attempt at building TWRP myself. Hours of research with trial 'n error has yielded me what this repository covers. Any contributions are most certainly welcomed.

# [WIP] Android device tree for samsung SM-T390 (gtactive2wifi)

```
#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
```

## Generation Info:

* Firmware used: [T390XXSACUJ1](https://samfw.com/firmware/SM-T390/XAR/T390XXSACUJ1).
* Firmware dumped via [dumpyara](https://github.com/sebaubuntu-python/dumpyara).
* Device tree generated via [twrpdtgen](https://github.com/twrpdtgen/twrpdtgen) using dumped `recovery.img`.

## Build Environment

### Python 

* Python 3.10.12 (dumpyara, twrpdtgen)
* Python 2.7.18 (platform_manifest_twrp_omni)

## Hacks

### python3.10/site-packages/sebaubuntu_libs/libandroid/device_info.py

For an unknown reason, twrpdtgen isn't able to find `ro.product.board` from the dumped `recovery.img`.

Using my rooted gtactive2wifi, `getprop ro.product.board` returned `[universal7870]`

Within `device_info.py`, I hardcoded the bootloader board name:  
`#self.bootloader_board_name = self.get_first_prop(BOOTLOADER_BOARD_NAME)`  
`self.bootloader_board_name = "universal7870"`

This was the only hangup for twrpdtgen. After implementing the hack, this device tree was twrpdtgen's output.

## TWRP Build Issues

Using [platform_manifest_twrp_omni (twrp-9.0)](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni/tree/twrp-9.0) with this device tree successfully produced a `recovery.img`. However, upon flashing, the boot error `Could not do normal boot invalid ramdisk length` came up. Normal boot and recovery broke, the only fix was to go into download mode and reflash stock firmware. I lack the knowledge and experience to figure out a fix for this, all of my research efforts didn't turn up anything useful.

Using [platform_manifest_twrp_omni (twrp-7.1)](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni/tree/twrp-7.1) with this device tree successfully produced a `recovery.img`. Upon flashing, TWRP recovery *does* load up, however a plethora of errors are present. Flashing/wiping/backups all error out with either a `permission denied`, a `not found`, or something of the sorts. Also, normal boot bootloops. Again, flashing stock firmware is the only fix.

Honestly, I don't know which platform_manifest_twrp_omni branch I should be using. The Samsung SM-T390 (gtactive2wifi) originally shipped with Android 7.1.1, but runs on Android 9 when fully upgraded, hence why I tried both branches.

## Contributions

If you can pick up where I left off, by all means, I'll make sure to acknowledge any efforts put forth. Until I come across any useful info into fixing these build issues, I'm shelving this project for the time being. Contact me if you're interested in helping!
