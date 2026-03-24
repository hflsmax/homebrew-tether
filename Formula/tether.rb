class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.5/tether-aarch64-apple-darwin"
      sha256 "126f8f4427afe22c08d19076cb6cf219d35ee0f0f4c4dc921fbbe777edd75302"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.5/tether-x86_64-apple-darwin"
      sha256 "5e9c9d1fd81139e72674c98c84014d4ef315ac3ca5cfd50e5ba9febd076eec10"
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
