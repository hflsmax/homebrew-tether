class Tether < Formula
  desc "Persistent terminal sessions over SSH"
  homepage "https://github.com/hflsmax/tether"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hflsmax/tether/releases/download/v0.1.10/tether-aarch64-apple-darwin"
      sha256 "eb12d38f14b6987a252fdbd3bf739dd2a064d4cd9257d36fa15736dcc18b7ee1"
    else
      url "https://github.com/hflsmax/tether/releases/download/v0.1.10/tether-x86_64-apple-darwin"
      sha256 "c476c423d149bbf54703b220d1c48f3577c08abe51bd3a217cf03d946be86523"
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
