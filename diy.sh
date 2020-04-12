#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Timezone
sed -i "s/timezone='UTC'/timezone='CST-8'/" package/base-files/files/bin/config_generate
sed -i "/timezone='CST-8'/a set system.@system[-1].zonename='Asia/Shanghai'" ./package/base-files/files/bin/config_generate
# firewall custom
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user
# Debug kpr adapt aarch64
sed -i 's/,arm/,aarch64/' package/luci-app-koolproxyR/Makefile
#修改版本号
sed -i 's/OpenWrt/sunkist AutoBuild $(date "+%Y.%m.%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings
