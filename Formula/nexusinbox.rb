class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.2.1/nexusinbox-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "b4502d77a4c0531af4aacf0870868fb002f2927b7c63b715d077cda9a9061856"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.2.1/nexusinbox-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "5d7896fc1fa1b4f6b111ea3257afe9237b7c586cc244ce45c7fd2a34ade297d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.2.1/nexusinbox-0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e23968ab2e743705fbcd059e9845ee24b69ef57c157ca0857dae4a9029592a54"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.2.1/nexusinbox-0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0b123f5b2b2da1fae3797fafb52dbbb05e52e6f6d1e8ab98f4e9c350baf116f"
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
