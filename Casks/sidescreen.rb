cask "sidescreen" do
  version "0.1.0"
  sha256 "f9d25e038dee88e587d191065f1cc188bf4029ba0a0a86424b19a7a0b11b5608"

  url "https://github.com/fanzzzd/sidescreen/releases/download/v#{version}/Sidescreen-#{version}.dmg"
  name "Sidescreen"
  desc "Virtual displays for AI agents, so they work without taking your mouse"
  homepage "https://github.com/fanzzzd/sidescreen"

  depends_on macos: ">= :sequoia"

  app "Sidescreen.app"

  zap trash: "~/Library/Application Support/Sidescreen"
end
