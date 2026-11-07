cask "clistory" do
  version "1.1"
  sha256 "e93a10f899de0e0b1ce01cf72016fe0ea4da6e4385cbee6674a6cd0d88e3cb07"

  url "https://github.com/qingke04/clipboard-history/releases/download/v#{version}/Clistory-#{version}.dmg"
  name "Clistory"
  desc "剪贴板历史记录与管理工具"
  homepage "https://github.com/qingke04/clipboard-history"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  app "Clistory.app"

  uninstall quit: "com.clipboardmanager.app"

  zap trash: [
    "~/Library/Preferences/com.clipboardmanager.app.plist",
    "~/Library/Application Support/ClipboardManager",
  ]

  caveats <<~EOS
    当前版本为 ad-hoc 签名、未经过 Apple 公证。
    首次启动如被 Gatekeeper 拦截，请前往「系统设置 → 隐私与安全性」点击「仍要打开」，
    或在终端执行：
      xattr -dr com.apple.quarantine "/Applications/Clistory.app"
  EOS
end
