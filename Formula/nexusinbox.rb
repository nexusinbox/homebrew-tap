class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.6.1/nexusinbox-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "7cdced03ef8007b8d4f49e46a5354294ac93d843a6eced9413b120ad89f379dc"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.6.1/nexusinbox-0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "fddedb4ebc77cc4139cc4f23b542664398489f1b62becb86b4a9b43ce9bcfe08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.6.1/nexusinbox-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e813d42340bdadbc3aa5ffed6218e84ffe6d86e782df7dc50b4449325018a868"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.6.1/nexusinbox-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "360325750cc214b39378812547f3e7d6ee7240c3d3e61c26d17aa35dd2d2b8a1"
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
