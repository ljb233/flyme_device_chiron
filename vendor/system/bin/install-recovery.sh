#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 25165824 55fd405ce721ced95e2f4e49a7cd87d2dece428e 19185664 a74fe411033bc4b28aa4d326ebd5cee893dee597
fi
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:25165824:55fd405ce721ced95e2f4e49a7cd87d2dece428e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:19185664:a74fe411033bc4b28aa4d326ebd5cee893dee597 EMMC:/dev/block/bootdevice/by-name/recovery 55fd405ce721ced95e2f4e49a7cd87d2dece428e 25165824 a74fe411033bc4b28aa4d326ebd5cee893dee597:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
