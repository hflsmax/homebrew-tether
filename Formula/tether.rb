class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.13/tether-aarch64-apple-darwin"
      sha256 "d6236357a665f38a3f8dca2d649b06765c09dd3d18a2ce5c83d4c8af3d5fdfda"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.13/tether-x86_64-apple-darwin"
      sha256 "a7e15d3780286d4699d9345d8cec4de012be63dc821fd76cf2ec52aafa983b60"
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
