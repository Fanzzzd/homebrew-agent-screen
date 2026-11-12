cask "agent-screen" do
  version "0.1.32"
  sha256 "fd3d905e7d4cfb99cf1018d13b595e4c7371c99937b977145aefc23b37dbc0e9"

  url "https://github.com/fanzzzd/agent-screen/releases/download/v#{version}/AgentScreen-#{version}.dmg"
  name "Agent Screen"
  desc "Virtual displays for AI agents, so they work without taking your mouse"
  homepage "https://agentscreen.app"

  depends_on macos: :sequoia

  livecheck do
    url :url
    strategy :github_latest
  end

  # Agent Screen updates itself (Sparkle), and brew leaves it to.
  auto_updates true

  app "Agent Screen.app"

  uninstall quit: "app.agentscreen.AgentScreen"

  zap trash: [
    "~/Library/Application Support/Agent Screen",
    "~/Library/Logs/Agent Screen",
  ]
end
