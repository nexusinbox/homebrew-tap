class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.8.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.3/nexusinbox-0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "b4682971e501f27d72e563f8c80d0c805969d7c3a0209b07d2ecaf929d1292e9"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.3/nexusinbox-0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "f4a81430eb361ced91dc71d05bb6b9f80aec27c4435115d9b746016319013950"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.3/nexusinbox-0.8.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22962b837c9ca105255e75d2f2bda63d958a928eeee3dbbfdc8f29e16d9c418b"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.3/nexusinbox-0.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74949ec87f37c541f2905bd0a655a4ef52b2daf9aaeef4482c2c37146c781b25"
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
