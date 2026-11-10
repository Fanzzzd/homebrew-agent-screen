cask "agent-screen" do
  version "0.1.23"
  sha256 "23ccb1a20b533c41bd47c7cc31952712d55fae674711fb9c31b2ad490bf08b7a"

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
