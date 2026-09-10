cask "blussh" do
  version "1.0.3"
  sha256 "1249bc7ccf314ad56c36b7943c61b947c0158c894bde417676f47898cd1a9e71"

  url "https://github.com/blusa/blussh/releases/download/v#{version}/blussh-v#{version}.zip"
  name "blussh"
  desc "Menu bar app that monitors host connectivity across SSH config, Tailscale, and ZeroTier"
  homepage "https://github.com/blusa/blussh"

  depends_on macos: :sequoia

  app "blussh.app"

  zap trash: "~/Library/Preferences/cloud.blusa.blussh.plist"
end
