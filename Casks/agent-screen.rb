cask "agent-screen" do
  version "0.1.15"
  sha256 "a505ab96000dcbba13bf5deef9e5d6a20028327bf30ceff9c25c8d9eef48c652"

  url "https://github.com/fanzzzd/agent-screen/releases/download/v#{version}/AgentScreen-#{version}.dmg"
  name "Agent Screen"
  desc "Virtual displays for AI agents, so they work without taking your mouse"
  homepage "https://agentscreen.app"

  depends_on macos: :sequoia

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Agent Screen.app"

  uninstall quit: "app.agentscreen.AgentScreen"

  zap trash: [
    "~/Library/Application Support/Agent Screen",
    "~/Library/Logs/Agent Screen",
  ]
end
