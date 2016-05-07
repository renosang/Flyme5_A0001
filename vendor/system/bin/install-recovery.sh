#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9441280 237eb859470fbaafd0f4d891c55e78edb46b5abd 6739968 8e1118d962e47aa0beb2d2307769688777299dd9
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9441280:237eb859470fbaafd0f4d891c55e78edb46b5abd; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6739968:8e1118d962e47aa0beb2d2307769688777299dd9 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 237eb859470fbaafd0f4d891c55e78edb46b5abd 9441280 8e1118d962e47aa0beb2d2307769688777299dd9:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
