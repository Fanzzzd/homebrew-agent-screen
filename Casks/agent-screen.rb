cask "agent-screen" do
  version "0.1.33"
  sha256 "a6c3bccfd86f3a78d1b95e351b7ad6a6f6f252bd9a7261b063293f5b2e0e7da9"

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
