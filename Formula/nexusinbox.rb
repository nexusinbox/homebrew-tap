class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.1/nexusinbox-0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "3f6d0026620986a41654e0ddc7cb52d710ff276617905b2f2f947a727492824e"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.1/nexusinbox-0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "522e2f7a17dd6c6c1aede4471be0f769de37343bc3d1c37457794cd3a08abccf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.1/nexusinbox-0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2f4a9a6827be1de71a1369043e575f1f18fc8c518803ae96c0b2c93cee2a6de9"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.1/nexusinbox-0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d26916b1f70082ad8e2037289fa5e78a08dba25a85874901b1e28691a2f6309"
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
