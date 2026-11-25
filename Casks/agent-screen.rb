cask "agent-screen" do
  version "0.1.44"
  sha256 "0cc07b77a3c7a2cdc14065213445df140a6975177c98e462854bf845f008ef73"

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
