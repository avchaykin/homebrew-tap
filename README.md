# avchaykin/homebrew-tap

Homebrew tap for personal projects.

## Add tap

```bash
brew tap avchaykin/tap
```

## Install packages

```bash
# macOS apps (casks)
brew install --cask avchaykin/tap/screenshot-describer

# formulas
brew install avchaykin/tap/liberte-graph-v2
```

## CI

GitHub Actions workflow (`.github/workflows/ci.yml`) validates the tap on push/PR:
- `brew audit --strict --tap avchaykin/tap`
- builds and installs `liberte-graph-v2`
- installs `screenshot-describer` cask

Release sync workflow (`.github/workflows/update-liberte-graph-v2.yml`) checks hourly for a new `liberte-graph-v2` GitHub release and updates formula `url` + `sha256` automatically.
