class ScreenshotDescriber < Formula
  desc "Menubar service that watches a folder and processes new files"
  homepage "https://github.com/avchaykin/screenshot-describer"
  url "https://github.com/avchaykin/screenshot-describer/archive/refs/tags/v0.1.21.tar.gz"
  sha256 "251411414ea3b05b045c0aa93c75fe77713d11f732b97c8f375987307a90f003"
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
