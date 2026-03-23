class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.3/tether-aarch64-apple-darwin"
      sha256 "177dfdf58d4424f11d5ab30f252372ca94d46e37b3e58b4a36c1308ca81d35a4"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.3/tether-x86_64-apple-darwin"
      sha256 "964bb158395910e03a91f567d077eaa1fbe6d69851614aaa389281407a6283d1"
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
