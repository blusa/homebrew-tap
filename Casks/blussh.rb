cask "blussh" do
  version "1.0.4"
  sha256 "296a96f351eb9ebc9cc88dfb6c29c37c25fbffead09bb1397defd72cf7a91cc0"

  url "https://github.com/blusa/blussh/releases/download/v#{version}/blussh-v#{version}.zip"
  name "blussh"
  desc "Menu bar app that monitors host connectivity across SSH config, Tailscale, and ZeroTier"
  homepage "https://github.com/blusa/blussh"

  depends_on macos: :sequoia

  app "blussh.app"

  zap trash: "~/Library/Preferences/cloud.blusa.blussh.plist"
end
