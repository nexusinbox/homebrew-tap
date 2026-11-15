class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.0/nexusinbox-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "2f9bbcc5273f52afd4b7de61436deb53c1a609fbf79613efbdb68ca8ffcb3121"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.0/nexusinbox-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "6d95fc0cf9b9d20119b57753df265713e5df26ca86a3510aba5ad9ba7dac962a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.0/nexusinbox-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dfc9b24b08d028046433b3c686cec2c7507958dc4e3c7ed3cec2067748e326c6"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.0/nexusinbox-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f0d2108d4c3831bb4ed3eba9eae16e2949ffcdcdaa1582047c39da8453b9e58"
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
