# 兆能 ZN-M2 OpenWrt 固件

无 WiFi / 无 USB / 弱电箱专用 · 内核 4.4.60 · 推荐内存 512M+

感谢 [sdf8057](https://github.com/sdf8057/ipq6000) 大佬的 IPQ6000 源码贡献。

已反向移植：
- `kmod-ipt-socket` / `iptables-mod-socket` — Passwall 4.66-8+ 依赖
- `kmod-netlink-diag` — Passwall 4.70+ SingBox 依赖

已合并到 [sdf8057/ipq6000](https://github.com/openwrt-fork/sdf8057-ipq6000)。

---

## 固件变体

每次构建产出 **一个变体**，发布在 GitHub Release 中：

| 变体 | 说明 | 文件名后缀 |
|------|------|-----------|
| **basic** | 标准版，含 Passwall、ZeroTier 等 | `-basic` |

---

## 自动构建 & 更新

- **手动触发**：在 Actions 页面运行 `zn-m2 build`
- **自动触发**：无，仅支持手动触发
- **Release Tag** 与上游 Passwall 版本号一致（如 `26.10.29-1`）

### 编译流程

```
全量 config make download
  → make 编译 → 保存
  → 发布 basic 变体
```

---

## 集成软件

| 分类 | 软件 |
|------|------|
| 科学上网 | Passwall (Xray / Sing-box / Hysteria / Haproxy)、ChinaDNS-NG |
| 内网穿透 | ZeroTier |
| 管理 | htop、bash、curl、文件传输 |
| 主题 | Design |
| 其他 | WOL 唤醒、ARP 绑定、定时重启 |

---

## 刷机 & 升级

- 控制台：`192.168.1.1` · 默认密码：`password`

| 场景 | 文件 |
|------|------|
| uboot 刷机 | `*factory-basic.ubi` |
| 系统升级 | `*sysupgrade-basic.bin` |
| 软件包清单 | `*basic.manifest` |

---

## 手动构建

1. Fork 本仓库
2. 在 Actions 页面选择 `zn-m2 build` → `Run workflow`
3. 等待约 1–1.5 小时，构建产物自动发布到 Release
