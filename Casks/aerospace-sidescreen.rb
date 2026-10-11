cask "aerospace-sidescreen" do
  version "0.21.3-Beta"
  sha256 "f45101da7a09c9b27e819dd49fac32333ce03820c01103cea33c87cb519ac79d"

  url "https://github.com/Fanzzzd/AeroSpace/releases/download/sidescreen-v#{version}/AeroSpace-v#{version}-sidescreen.zip"
  name "AeroSpace (Sidescreen build)"
  desc "AeroSpace with an ignored-monitors option, so it leaves Sidescreen's displays alone"
  homepage "https://github.com/Fanzzzd/AeroSpace/blob/sidescreen/SIDESCREEN.md"

  # Same bundle id and app name as AeroSpace: one replaces the other.
  conflicts_with cask: ["aerospace", "aerospace-dev"]
  depends_on macos: :ventura

  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{staged_path}}/AeroSpace-v#{version}-sidescreen/bin/aerospace"], must_succeed: false
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{appdir}}/AeroSpace.app"], must_succeed: false
  end

  app "AeroSpace-v#{version}-sidescreen/AeroSpace.app"
  binary "AeroSpace-v#{version}-sidescreen/bin/aerospace"
  binary "AeroSpace-v#{version}-sidescreen/shell-completion/zsh/_aerospace",
         target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_aerospace"
  binary "AeroSpace-v#{version}-sidescreen/shell-completion/bash/aerospace",
         target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/aerospace"
  binary "AeroSpace-v#{version}-sidescreen/shell-completion/fish/aerospace.fish",
         target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/aerospace.fish"

  Dir["#{staged_path}/AeroSpace-v#{version}-sidescreen/manpage/*"].each { |man| manpage man }

  caveats <<~EOS
    This is AeroSpace by Nikita Bobko plus one patch: the ignored-monitors
    option, until AeroSpace has it. Your config stays as it is. To leave
    Sidescreen's displays alone, add to it:

      ignored-monitors = ['^Sidescreen']

    or choose "Keep AeroSpace Off Sidescreen's Displays…" in Sidescreen's menu.
    macOS asks you to allow Accessibility for AeroSpace again.
  EOS
end
