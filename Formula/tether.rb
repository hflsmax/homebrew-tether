class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.16/tether-aarch64-apple-darwin"
      sha256 "23f6ad458794c5d8be81856c9c7bbb13475159c373d3164e4ca638fcc65372b8"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.16/tether-x86_64-apple-darwin"
      sha256 "b16a8a24f1b50dc06e60325776f604e31af0ee89cabb6551160e05f5a3e5ef84"
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
