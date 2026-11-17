class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.10/nexusinbox-0.9.10-aarch64-apple-darwin.tar.gz"
      sha256 "d386243f3b9433cba56ba0b8d12e90ef42787373fdc0bd26daa3969f5d4f014a"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.10/nexusinbox-0.9.10-x86_64-apple-darwin.tar.gz"
      sha256 "4012380a2d71f282bb5f2489352939cac5686d72bae14cf118150177440f49be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.10/nexusinbox-0.9.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fda32673554192afe4614eaa4c1b38e5c1bc6e6e068409a0d25554abff1fe3ad"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.10/nexusinbox-0.9.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c66def22b6819d17a164dcad080d58a1fd468cdc16426eed8d891b0bdc18fed0"
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
