class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.12/tether-aarch64-apple-darwin"
      sha256 "a0c2d2af663dfeaf961b553c7913b9b8492aeeaf310416c96be4823aad66e203"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.12/tether-x86_64-apple-darwin"
      sha256 "025b9ed4fa56127948b7d83e7bd543db37d9a7ea98cd7b218f40bfc0b4f55afc"
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
