cask "blussh" do
  version "1.0.2"
  sha256 "12fe21198bcc05d86ebb88bf1997d8f085c6d25d9ace6c12071ee215f56b3f0a"

  url "https://github.com/blusa/blussh/releases/download/v#{version}/blussh-v#{version}.zip"
  name "blussh"
  desc "Menu bar app that monitors host connectivity across SSH config, Tailscale, and ZeroTier"
  homepage "https://github.com/blusa/blussh"

  depends_on macos: :sequoia

  app "blussh.app"

  caveats <<~EOS
    blussh is not notarized. Clear the quarantine flag after install:
      xattr -dr com.apple.quarantine /Applications/blussh.app
  EOS

  zap trash: "~/Library/Preferences/cloud.blusa.blussh.plist"
end
