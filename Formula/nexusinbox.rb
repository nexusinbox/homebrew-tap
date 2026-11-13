class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.6.0/nexusinbox-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "069491cee5dd1acf7b634aae1bc4f59cc767c13d732d936dbe4c69c40d8f084d"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.6.0/nexusinbox-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "856a267a7fd5421d58e5fbfb2c463c984cc4423f4d5d168ba92d584f9951dad8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.6.0/nexusinbox-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec9047e4e1c9aeec86983cc0cfffe9e5c7515610b3b67fde5437f14fe69d7d5b"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.6.0/nexusinbox-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "755c2aa058e41eb03cc6dc817e90fc6a75e934f361fae22c49ad6f3dbec2673f"
    end
  end

  def install
    # nexusinbox finds the signer and the gateway beside itself.
    bin.install "nexusinbox", "nexusinbox-signer", "nexusinbox-gateway"
  end

  test do
    assert_match "nexusinbox connect", shell_output("#{bin}/nexusinbox 2>&1", 1)
    assert_match "Signer Daemon", shell_output("#{bin}/nexusinbox-signer --help")
  end
end
