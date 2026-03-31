class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.15/tether-aarch64-apple-darwin"
      sha256 "e1d0d000ed4a9584292724fc4f763901b7b1b2b2425065b125b64d950dc7f3aa"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.15/tether-x86_64-apple-darwin"
      sha256 "f56fc9de07d2d6a2e6c14aab76d8cafad29658a6b6c2dd8b7d302c50b4827a9f"
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
