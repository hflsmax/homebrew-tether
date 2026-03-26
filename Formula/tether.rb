class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.7/tether-aarch64-apple-darwin"
      sha256 "2fa6c22a1ac084f111214a183d5fe50db78e5700651e881fea92643286dd8b82"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.7/tether-x86_64-apple-darwin"
      sha256 "6e0201686c7d8a1455ab0d15978bf4783210e6a9dbe6759761002e68cd9b174a"
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
