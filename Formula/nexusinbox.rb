class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.8.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.2/nexusinbox-0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "eba58b5ff90e2ac7e3d4f4d6477b2f98f87843bca5b38052428517409fb1a02d"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.2/nexusinbox-0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "32a2643aa2b73f691008a1cafe7f62b0baf97f1ff9a9d00949eeb5303381b387"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.2/nexusinbox-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b6641a915f406b80376a4a4f85f136d1a1926e8905ccef4f25a3bca906a541d"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.2/nexusinbox-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abe864fbbe2ca3b70aa849e352ea15040813c34b36e9d4d1a08b2d054151cb43"
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
