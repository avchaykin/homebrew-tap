cask "screenshot-describer" do
  version :latest
  sha256 :no_check

  url "https://github.com/avchaykin/screenshot-describer/releases/latest/download/screenshot-describer-macos.zip"
  name "Screenshot Describer"
  desc "Menubar watcher for screenshot processing"
  homepage "https://github.com/avchaykin/screenshot-describer"

  app "ScreenshotDescriber.app"

  uninstall quit: "com.avchaykin.screenshot-describer"
end
