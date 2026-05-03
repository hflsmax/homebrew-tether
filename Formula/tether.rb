class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.21/tether-aarch64-apple-darwin"
      sha256 "a92dab626fcd3092ccab5c8886674418ce6269b97d9553718d100b545d6298e5"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.21/tether-x86_64-apple-darwin"
      sha256 "95f818b9c0f2ad268468b502aefa691810b363a6b81686d6165be365c56f92ab"
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
