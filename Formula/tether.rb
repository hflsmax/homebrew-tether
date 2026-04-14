class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.18/tether-aarch64-apple-darwin"
      sha256 "a8163dd0b9fd5867f3b80426979765f847eaab1bbb1921de5c50204f35ac24bc"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.18/tether-x86_64-apple-darwin"
      sha256 "5d41e8de9fa4e63e5fd2a062f9e39ae4adb358067de7becb6da7cc2950ea8ad0"
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
