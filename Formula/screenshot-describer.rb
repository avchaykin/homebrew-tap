class ScreenshotDescriber < Formula
  desc "Menubar service that watches a folder and processes new files"
  homepage "https://github.com/avchaykin/screenshot-describer"
  url "https://github.com/avchaykin/screenshot-describer/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1d94efd2119b1a8f5adcac9083721750ee480ae2b0c9320dbd9cb9e83d7e9db4"
  license "MIT"
  head "https://github.com/avchaykin/screenshot-describer.git", branch: "main"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release"
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
