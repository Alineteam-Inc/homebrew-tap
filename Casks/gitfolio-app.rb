# Written to Alineteam-Inc/homebrew-tap by Alineteam-Inc/GitFolio-APP's release workflow, from its
# packaging/homebrew/gitfolio-app.rb, with each release's version and checksums: edit it there.
cask "gitfolio-app" do
  arch arm: "arm64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "d3e418c0308b67f7ed4d05480bd5c457907d4cb8ad5861c7ef33d72110ef9111",
         intel: "d7cc6c2986bd7b009677c79ca4b5e174414a7b92e95dfe02a2398c2d51802509"

  url "https://github.com/Alineteam-Inc/GitFolio-APP/releases/download/v#{version}/GitFolio_macos_#{arch}.dmg"
  name "GitFolio"
  desc "Menu bar app that turns your git history into a verified developer portfolio"
  homepage "https://github.com/Alineteam-Inc/GitFolio-APP"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

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
    Before `brew uninstall --cask alineteam-inc/tap/gitfolio-app`, open GitFolio › About › Uninstall: it removes the git hooks
    GitFolio added, its daily sync and this computer's login.
  EOS
end
