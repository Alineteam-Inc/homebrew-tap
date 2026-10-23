# Written to Alineteam-Inc/homebrew-tap by Alineteam-Inc/GitFolio-APP's release workflow, from its
# packaging/homebrew/gitfolio-app.rb, with each release's version and checksums: edit it there.
cask "gitfolio-app" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "0f0e8724beff2eeb4e5a4219d512b9326c61d32c7840c0f123d8f5117694551b",
         intel: "5dace5de3b01da91cdfb4e9e85cf168a8ffb708a2b47f855840f40c7af7d0b72"

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
