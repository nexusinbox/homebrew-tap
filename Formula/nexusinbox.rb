class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.5.0/nexusinbox-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "5200ed097a60741dcfcd57269edcb6d2cfff8cb5a2b5deebe2772c2022326a8b"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.5.0/nexusinbox-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "c9382af949c5d1d191a0ed5a11a0317eb0d1d9eb29cf625951ac41fc3d33b103"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.5.0/nexusinbox-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12d02053a4c5ff70eda6fc1055936c92c66adbf6e052ef5eaf1cabd069d43ee1"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.5.0/nexusinbox-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20f540ce31615658a88e13fa7204f18f1ab7690d878fb9d002452e143a7ef270"
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
