class LiberteGraphV2 < Formula
  desc "Liberte Graph visual home schematic editor"
  homepage "https://github.com/avchaykin/liberte-graph-v2"
  url "https://github.com/avchaykin/liberte-graph-v2/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b044a444e5db73f1980facbdb14028df59b69ea2a35f34356f8a4a5eec687005"
  license "MIT"
  head "https://github.com/avchaykin/liberte-graph-v2.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "node" => :build

  def install
    system "npm", "install", "--include=dev"
    system "npm", "run", "build"

    libexec.install "dist"

    (bin/"liberte-graph-v2").write <<~EOS
      #!/bin/bash
      PORT="${1:-4180}"
      exec /usr/bin/python3 -m http.server "$PORT" --bind 0.0.0.0 --directory "#{libexec}/dist"
    EOS
  end

  service do
    run [opt_bin/"liberte-graph-v2", "4180"]
    keep_alive true
    working_dir var
    log_path var/"log/liberte-graph-v2.log"
    error_log_path var/"log/liberte-graph-v2.err.log"
  end

  test do
    assert_match "usage", shell_output("#{bin}/liberte-graph-v2 --help 2>&1").downcase
  end
end
