# Written to Alineteam-Inc/homebrew-tap by Alineteam-Inc/GitFolio-APP's release workflow, from its
# packaging/homebrew/gitfolio-app.rb, with each release's version and checksums: edit it there.
cask "gitfolio-app" do
  arch arm: "arm64", intel: "x64"

  version "0.1.10"
  sha256 arm:   "4f9784b0e06bd78f58918acb30bc8f2fc3ba2632afa78d6dc5f8f8aaa1c498b7",
         intel: "eba34efa37fed185cb57081c13bd1007a4295bd1a3f9714f73c181476f0e3156"

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
