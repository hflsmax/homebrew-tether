class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.6/tether-aarch64-apple-darwin"
      sha256 "b4ee33811782107180386d1cd6efb4dd35664c1825516120c7fa2ab98e4f02ff"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.6/tether-x86_64-apple-darwin"
      sha256 "98ac1b201dc43fa936402df3f909aa2b6813dfc69e3f71b9a6975e6dac96ec4f"
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
