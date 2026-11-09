class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.2.0/nexusinbox-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "9ead206b51f32e74fa3fbd7191745d0f8171a4d0bdcc7624a278507f23c02053"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.2.0/nexusinbox-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "edfd1a8213d37ddd27baf5b5141d6a838f2c9f3846686a2a7931512f8a23c750"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.2.0/nexusinbox-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ff0cc7b3f367b27aea98380490578d0da3a554afc32e09dcbbfe64030df547e"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.2.0/nexusinbox-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df77208c3eb71b0e8d99bc72a865f8373fa83c25408dd405c58ce33ebc846b07"
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
