cask "blussh" do
  version "1.0.5"
  sha256 "e647802066a1f8bfff5df11ba270f669100edf6d7d778e7fd1f5cfca0f938965"

  url "https://github.com/blusa/bleet/releases/download/v#{version}/blussh-v#{version}.zip"
  name "blussh"
  desc "Menu bar app that monitors host connectivity across SSH config, Tailscale, and ZeroTier"
  homepage "https://github.com/blusa/bleet"

  depends_on macos: :sequoia

  app "blussh.app"

  # Replacing the bundle under a running instance leaves processes pinned to a
  # deleted bundle; Gatekeeper later rescans those, fails to read the missing
  # file, and SIGKILLs every process it tracks for the app -- including the
  # healthy one. Quit it before installing.
  preflight_steps do
    terminate_process "blussh"
  end

  # Homebrew 6 dropped --no-quarantine, and a quarantined app that was never
  # manually approved is silently refused when launchd starts it at login
  # (the launch dies as xpcproxy). The app is notarized, so Gatekeeper has
  # already vouched for it; drop the flag so launch-at-login works.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/blussh.app"]
  end

  zap trash: "~/Library/Preferences/cloud.blusa.blussh.plist"
end
