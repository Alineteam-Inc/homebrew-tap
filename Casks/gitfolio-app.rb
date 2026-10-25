# Written to Alineteam-Inc/homebrew-tap by Alineteam-Inc/GitFolio-APP's release workflow, from its
# packaging/homebrew/gitfolio-app.rb, with each release's version and checksums: edit it there.
cask "gitfolio-app" do
  arch arm: "arm64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "e8a03606caf834d9ab3d147ce4a4844c19812f67f14fda6e3030a3e8a6cd20f3",
         intel: "84299d7263e5d022315f4683ece08e4542f657c56804f9390359f2a49e894264"

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
