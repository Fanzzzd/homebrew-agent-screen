cask "sidescreen" do
  version "0.1.1"
  sha256 "dc426cbc2d9a5436dc2bdeaa751316ce295c006c05a6c6389875b723e77b2236"

  url "https://github.com/fanzzzd/sidescreen/releases/download/v#{version}/Sidescreen-#{version}.dmg"
  name "Sidescreen"
  desc "Virtual displays for AI agents, so they work without taking your mouse"
  homepage "https://github.com/fanzzzd/sidescreen"

  depends_on macos: ">= :sequoia"

  app "Sidescreen.app"

  zap trash: "~/Library/Application Support/Sidescreen"
end
