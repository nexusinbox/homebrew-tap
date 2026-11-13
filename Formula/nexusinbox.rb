class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.7.0/nexusinbox-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "d2c4f561c9a7ee6d03980866d7a0f9ed327a5edf14b68c7ef049c49551d326c1"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.7.0/nexusinbox-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "85c0431e90fb564c463cd3617752eae0568f43bd38ca9e09eaa477cf70528fb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.7.0/nexusinbox-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af418a9144b4b19a23f8a30b271be5ceb672f02295b1465f51094bd6efb705e8"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.7.0/nexusinbox-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "389c3fb67bba022c009c73471b7a2d2ff3d971bde96cd7980e0542000f9bfce0"
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
