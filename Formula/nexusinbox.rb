class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.8/nexusinbox-0.9.8-aarch64-apple-darwin.tar.gz"
      sha256 "3e2e842454fc55dde5cbe50bcff7d49f4f0c813d7d41a93543c05a138a532228"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.8/nexusinbox-0.9.8-x86_64-apple-darwin.tar.gz"
      sha256 "5e7daabb180d51dd6ba218788e09935c32e8ea4d74d8cb0e05c28c2e65004a7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.8/nexusinbox-0.9.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b91679ebf039cc5d83baae85ca83c294f210d1033fde34a63c54078301c15fe0"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.8/nexusinbox-0.9.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13881a73fadc70c2d6baee8caf3e4d14588c4852306655f90b4be41f1ed58a99"
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
