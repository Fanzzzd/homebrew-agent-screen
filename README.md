# Homebrew tap for Agent Screen

```sh
brew tap fanzzzd/agent-screen
brew trust fanzzzd/agent-screen
brew install --cask agent-screen
```

Homebrew loads casks from a tap outside its own only once you trust it. That includes the old names: `aerospace-sidescreen` moves to `aerospace-agent-screen`, and Homebrew refuses to load it until you run `brew trust fanzzzd/agent-screen`.

`aerospace-agent-screen` is AeroSpace with the patches that keep it off Agent Screen's displays: see [Agent Screen with AeroSpace](https://github.com/Fanzzzd/agent-screen/blob/main/docs/aerospace.md).

See https://github.com/Fanzzzd/agent-screen.
