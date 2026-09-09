cask "blussh" do
  version "1.0.0"
  sha256 "cc8ca8351591f2a748757a2694e92f94186f464249667357a357ef7ecd706cc1"

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
