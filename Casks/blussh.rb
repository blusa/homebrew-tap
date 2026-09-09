cask "blussh" do
  version "1.0.1"
  sha256 "34b0d06eb1a7d7b7ae64664afa7b44826b088b958962b5cbaa7574e918d40790"

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
