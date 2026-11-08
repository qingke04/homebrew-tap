cask "clistory" do
  version "1.1.1"
  sha256 "d98b0c2e341bc4c675a0237c719a9b9ccdad37b9fa5906a8a12a15f226509885"

  url "https://github.com/qingke04/clistory/releases/download/v#{version}/Clistory-#{version}.dmg"
  name "Clistory"
  desc "剪贴板历史记录与管理工具"
  homepage "https://github.com/qingke04/clistory"

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
