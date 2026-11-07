# homebrew-tap

[Clistory](https://github.com/qingke04/clipboard-history)（中文名：历史粘贴板，Clip Once. Paste Anytime.）的 Homebrew Tap。

## 安装

```bash
brew install --cask qingke04/tap/clipboard-history
```

该命令会自动 tap 本仓库，并且只信任 `clipboard-history` 这一个 cask（Homebrew 6 起的 tap trust 机制）。

也可以先 tap 再安装：

```bash
brew tap qingke04/tap
brew trust --cask qingke04/tap/clipboard-history
brew install --cask clipboard-history
```

## 更新

```bash
brew upgrade --cask qingke04/tap/clipboard-history
```

## 卸载

```bash
brew uninstall --cask qingke04/tap/clipboard-history
# 连同历史记录一起删除
brew uninstall --zap --cask qingke04/tap/clipboard-history
```

## 首次启动说明

当前版本为 ad-hoc 签名、未经过 Apple 公证。Homebrew 会给下载的 app 带上 quarantine 标记，
因此首次启动可能被 Gatekeeper 拦截：请前往「系统设置 → 隐私与安全性」点击「仍要打开」，
或在终端执行：

```bash
xattr -dr com.apple.quarantine "/Applications/Clistory.app"
```

## 维护者说明

发版后更新 `Casks/clipboard-history.rb`：

1. 修改 `version` 为新的版本号（tag 需为 `v<version>`）；
2. 重新生成安装包，并更新 `sha256`（`shasum -a 256 Clistory-<version>.dmg`）；
3. 提交推送后，用户即可通过 `brew upgrade` 升级。

> 安装包命名必须保持 `Clistory-<version>.dmg`，tag 保持 `v<version>`，否则 cask 的 URL 无法拼接。
