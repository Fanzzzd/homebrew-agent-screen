cask "sidescreen" do
  version "0.1.2"
  sha256 "3f23f525fb0c62a82ffecc37119cc1451a215c1282d5bf30130eb7ba6e214cf5"

  url "https://github.com/fanzzzd/sidescreen/releases/download/v#{version}/Sidescreen-#{version}.dmg"
  name "Sidescreen"
  desc "Virtual displays for AI agents, so they work without taking your mouse"
  homepage "https://github.com/fanzzzd/sidescreen"

  depends_on macos: :sequoia

  app "Sidescreen.app"

  zap trash: "~/Library/Application Support/Sidescreen"
end
