class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.17/tether-aarch64-apple-darwin"
      sha256 "87f927d38800247bfc244a7114476784906fabbb89f7cb7fa2a79fa22e45b33c"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.17/tether-x86_64-apple-darwin"
      sha256 "81e0bde003c29cc5abe37bd4f32de01bf8cc39d501cbbef287f68ab80a118e3c"
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
