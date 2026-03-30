class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.14/tether-aarch64-apple-darwin"
      sha256 "24b6b6da780c214a15a0bbb1e61b0dcee2ab40efbd28f7801a3722deaf6aff73"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.14/tether-x86_64-apple-darwin"
      sha256 "0c731f7785483fee2e5e45906193f137e18800b91cb6701edde103951e21e5d0"
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
