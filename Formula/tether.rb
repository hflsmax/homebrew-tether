class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.11/tether-aarch64-apple-darwin"
      sha256 "27d5f981384a7e863c855aa06843cd521cfc52e99e5649ffa21868652faddbb0"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.11/tether-x86_64-apple-darwin"
      sha256 "2ae52d269ceeb98e65ad8b3f307af4830c6df32de80c2d9e3c85387e9f74e6ef"
    end
  end

  def install
    binary = Dir["tether-*"].first || "tether"
    bin.install binary => "tether"
  end

  test do
    assert_match "tether #{version}", shell_output("#{bin}/tether --version")
  end
end
