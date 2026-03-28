class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.9/tether-aarch64-apple-darwin"
      sha256 "cbf5693ae225d9d417499bfdc802f3885b1811e0b5e4ee8998fc508b9b3123e1"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.9/tether-x86_64-apple-darwin"
      sha256 "0fa1cb633edf1d80edc6f77c72a84d48e0596cc1e4fa83bb6dde9c89c80cd7e0"
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
