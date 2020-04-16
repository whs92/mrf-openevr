# Petalinux files

`partition 1` contains the boot partition files as described on the wiki. `parition 2` contains the rootfs zip which when extracted forms the ext3 partition. These two partitions are simply pulled off the SD card image currently stored by Will Smith.


`system-user.dtsi` contains the latest device tree file. It belongs under

`<petalinux project dir>/software/project-spec/meta-user/recipes-bsp/device-tree` to be built into the image.ub
