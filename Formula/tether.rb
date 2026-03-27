class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.8/tether-aarch64-apple-darwin"
      sha256 "9609fd91bb6dddb4fd5f4609da7a3d58be252fdf6f107e0928f516a88a56fc55"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.8/tether-x86_64-apple-darwin"
      sha256 "d354e702749a424032cafb316219fbc8c5583bdacec491773fe29ac3b6e89664"
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
