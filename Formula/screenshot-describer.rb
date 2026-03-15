class ScreenshotDescriber < Formula
  desc "Menubar service that watches a folder and processes new files"
  homepage "https://github.com/avchaykin/screenshot-describer"
  url "https://github.com/avchaykin/screenshot-describer/archive/refs/tags/v0.1.16.tar.gz"
  sha256 "01ebae3ad43bfd12022d55de47e530fb60d15c126a399df55a06c5b9384108d9"
  license "MIT"
  head "https://github.com/avchaykin/screenshot-describer.git", branch: "main"

  depends_on :macos

  def install
    # Work around sandbox-exec failures seen on some macOS setups during SwiftPM manifest evaluation.
    ENV["SWIFTPM_DISABLE_SANDBOX"] = "1"

    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/screenshot-describer"
  end

  service do
    run [opt_bin/"screenshot-describer"]
    keep_alive true
    log_path var/"log/screenshot-describer.log"
    error_log_path var/"log/screenshot-describer.err.log"
  end

  test do
    assert_path_exists bin/"screenshot-describer"
  end
end
