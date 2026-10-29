cask "agent-screen" do
  version "0.1.19"
  sha256 "7a7f5b6bf9a4ae139e75b6f48d7eaa5efb1dfa9f3bcebfbbbe3e01e0946bfb42"

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
