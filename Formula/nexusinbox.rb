class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.8.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.4/nexusinbox-0.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "f627df750afbb981d59191d8dcb2bc94b7d8db773aab06dd70f5812674768b11"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.4/nexusinbox-0.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "d6c2b0b61135d97ee410eb274fb5bd8310b3e5c7226e51684ad155ab69d5800d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.4/nexusinbox-0.8.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae45a1f1650386379fd7a8227e5d72a2db964e0ac031bff849d847c7fa3405b1"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.4/nexusinbox-0.8.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7971ef58d6a8dfd696cb78dff43a3e69613c017edf9a635f6a2ce37068971fd7"
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
