class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.16/tether-aarch64-apple-darwin"
      sha256 "56f857fd6c4eed3dc5e9acba93246bdee380e26dd451e4e76c1c5df5ed1093a5"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.16/tether-x86_64-apple-darwin"
      sha256 "f1839aa1c99aaa45e381f932707399d2746039dfa16dcfc281adbc4dcd6e08b7"
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
