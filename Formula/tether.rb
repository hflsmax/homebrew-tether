class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.4/tether-aarch64-apple-darwin"
      sha256 "f1d861198fd0c83bad7c17ff11a77238024d086e4bed62a6983151518cb74e1e"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.4/tether-x86_64-apple-darwin"
      sha256 "86dab466613729c778d69d72816bdcacfc20aed74f31b796a5386ab288efc54d"
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
