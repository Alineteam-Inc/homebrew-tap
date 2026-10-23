# Written to Alineteam-Inc/homebrew-tap by Alineteam-Inc/GitFolio-APP's release workflow, from its
# packaging/homebrew/gitfolio-app.rb, with each release's version and checksums: edit it there.
cask "gitfolio-app" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "f87fd3f5f0e62fbc9404ca9c70f8e1b2cb961721e49bd955a77bfc2dbbff4e65",
         intel: "55f41f10eced33a6b11e55555c8cf4b6a839272f87647689f1cb4dc38f50006f"

  url "https://github.com/Alineteam-Inc/GitFolio-APP/releases/download/v#{version}/GitFolio_macos_#{arch}.dmg"
  name "GitFolio"
  desc "Menu bar app that turns your git history into a verified developer portfolio"
  homepage "https://github.com/Alineteam-Inc/GitFolio-APP"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "GitFolio.app"

  uninstall launchctl: "GitFolio",
            quit:      "team.aline.gitfolio.gui"

  zap trash: [
    "~/Library/Application Support/team.aline.gitfolio.gui",
    "~/Library/Caches/team.aline.gitfolio.gui",
    "~/Library/LaunchAgents/GitFolio.plist",
    "~/Library/WebKit/team.aline.gitfolio.gui",
  ]

  caveats <<~EOS
    Before `brew uninstall --cask gitfolio-app`, open GitFolio › About › Uninstall: it removes the git hooks
    GitFolio added, its daily sync and this computer's login.
  EOS
end
