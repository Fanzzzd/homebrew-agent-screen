cask "sidescreen" do
  version "0.1.9"
  sha256 "698e2a91dff276aedb4f0034e520a440106f7ca37a34406d41ab5fcc2c94d2a2"

  url "https://github.com/fanzzzd/sidescreen/releases/download/v#{version}/Sidescreen-#{version}.dmg"
  name "Sidescreen"
  desc "Virtual displays for AI agents, so they work without taking your mouse"
  homepage "https://github.com/fanzzzd/sidescreen"

  depends_on macos: :sequoia

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Sidescreen.app"

  # Releases are signed but not notarized: without this, macOS blocks the
  # first launch until the user allows it in System Settings.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Sidescreen.app"], must_succeed: false
  end

  uninstall quit: "dev.sidescreen.menubar"

  zap trash: "~/Library/Application Support/Sidescreen"
end
