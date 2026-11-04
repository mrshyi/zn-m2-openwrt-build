#!/bin/bash
set -euo pipefail

cd openwrt/bin/targets/*/*
rm -rf packages
echo "FIRMWARE=$PWD" >> "$GITHUB_ENV"

mkdir -p /tmp/release-firmware

copy_with_suffix() {
  local src="$1" suffix="$2"
  local fn
  fn=$(basename "$src")
  if [[ "$fn" == *.* ]]; then
    local name="${fn%.*}" ext="${fn##*.}"
    cp "$src" "/tmp/release-firmware/${name}-${suffix}.${ext}"
  else
    cp "$src" "/tmp/release-firmware/${fn}-${suffix}"
  fi
}

for f in /tmp/firmware-basic/*; do
  copy_with_suffix "$f" "basic"
done

# gecoosac-v2 变体已停用（config 中移除 gecoosac，workflow 不再执行 Build 2），
# 此处不再复制第二份。恢复双变体时把原循环加回即可。

echo "Release firmware files:"
ls -la /tmp/release-firmware/
