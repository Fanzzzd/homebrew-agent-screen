cask "aerospace-agent-screen" do
  version "0.21.3-Beta"
  sha256 "f45101da7a09c9b27e819dd49fac32333ce03820c01103cea33c87cb519ac79d"

  # The fork's branch was named sidescreen until 2026-10-22, and so are the tag and folder of its release from then.
  # Releases after it say agent-screen.
  build = "sidescreen"

  url "https://github.com/Fanzzzd/AeroSpace/releases/download/#{build}-v#{version}/AeroSpace-v#{version}-#{build}.zip"
  name "AeroSpace (Agent Screen build)"
  desc "AeroSpace that leaves Agent Screen's displays alone"
  homepage "https://github.com/Fanzzzd/AeroSpace/blob/agent-screen/AGENT-SCREEN.md"

  # Same bundle id and app name as AeroSpace: one replaces the other.
  conflicts_with cask: ["aerospace", "aerospace-dev"]
  depends_on macos: :ventura

  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{staged_path}}/AeroSpace-v#{version}-#{build}/bin/aerospace"], must_succeed: false
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{appdir}}/AeroSpace.app"], must_succeed: false
  end

  app "AeroSpace-v#{version}-#{build}/AeroSpace.app"
  binary "AeroSpace-v#{version}-#{build}/bin/aerospace"
  binary "AeroSpace-v#{version}-#{build}/shell-completion/zsh/_aerospace",
         target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_aerospace"
  binary "AeroSpace-v#{version}-#{build}/shell-completion/bash/aerospace",
         target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/aerospace"
  binary "AeroSpace-v#{version}-#{build}/shell-completion/fish/aerospace.fish",
         target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/aerospace.fish"

  Dir["#{staged_path}/AeroSpace-v#{version}-#{build}/manpage/*"].each { |man| manpage man }

  caveats <<~EOS
    This is AeroSpace by Nikita Bobko plus one patch: the ignored-monitors
    option, until AeroSpace has it. Your config stays as it is. To leave
    Agent Screen's displays alone, add to it:

      ignored-monitors = ['^Agent Screen']

    or choose "Keep AeroSpace Off Agent Screen's Displays…" in Agent Screen's
    menu. Versions that read claim files don't need this line.
    macOS keeps Accessibility permission per signature, so the old
    AeroSpace's entry doesn't work for this build. Clear it and allow
    AeroSpace again when macOS asks:

      tccutil reset Accessibility bobko.aerospace
      open -a AeroSpace
  EOS
end
