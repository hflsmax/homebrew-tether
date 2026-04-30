class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.20/tether-aarch64-apple-darwin"
      sha256 "6045175c01c095df2936ea0b71f0fce21de613a1bcfa06775f14a7aeb82d31f2"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.20/tether-x86_64-apple-darwin"
      sha256 "cdf990da31758b26bba342e36554bad07a19a98712cd5bc13c787ae3a977c6d0"
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
