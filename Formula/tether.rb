class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.19/tether-aarch64-apple-darwin"
      sha256 "e588e8be93243e5e4cf2299501d7bea69c32618b0827890f011d1176008d31f3"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.19/tether-x86_64-apple-darwin"
      sha256 "f5d61f2031a2b6983c743180a8d27ce80b2f08fd35ac87c4805b9438c35ab9dd"
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
