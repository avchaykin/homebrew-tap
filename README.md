# avchaykin/tap

Homebrew tap for personal projects.

## Add tap

```bash
brew tap avchaykin/tap
```

## Install packages

```bash
# formulas
brew install avchaykin/tap/liberte-graph-v2
brew install avchaykin/tap/screenshot-describer
```

## Run as service

```bash
brew services start avchaykin/tap/screenshot-describer
brew services list | grep screenshot-describer
```

## CI

GitHub Actions workflow (`.github/workflows/ci.yml`) validates the tap on push/PR:
- `brew audit --strict --tap avchaykin/tap`
- builds and installs `liberte-graph-v2`
- installs `screenshot-describer` cask

Release sync workflows check hourly for new GitHub releases and update formula `url` + `sha256` automatically:
- `.github/workflows/update-liberte-graph-v2.yml`
- `.github/workflows/update-screenshot-describer.yml`
