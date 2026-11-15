class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.8.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.5/nexusinbox-0.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "fa44508857f8fac8a39ad4e001752a001be65f6f831372bee61342c2a5de918e"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.5/nexusinbox-0.8.5-x86_64-apple-darwin.tar.gz"
      sha256 "c6ff4f47212dee6b2fdee3d2b5116973c5b3900b487e6af853eb97f57f672a18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.5/nexusinbox-0.8.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5202b16cc92d93162fa8f469a969f6622ef4a03f38046fd6f94c7dd47e017142"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.5/nexusinbox-0.8.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce925e50ff6cc37d1d74a614da5aeae6ca2c4f08f5e389d85f98615cb987ae2b"
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
