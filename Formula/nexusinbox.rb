class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.7/nexusinbox-0.9.7-aarch64-apple-darwin.tar.gz"
      sha256 "7308b101c9c1db2179c1c3a3cf58c82f1c6c7158e8c243d896594470632b0dce"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.7/nexusinbox-0.9.7-x86_64-apple-darwin.tar.gz"
      sha256 "bf2ade5b4923624053513a010090e347d676770171bfcefb0ffacb9423a7f6ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.7/nexusinbox-0.9.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2b2119f3cde564d30405657a52873244c34084ef54f209b5bc8b77e7f8d37db"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.7/nexusinbox-0.9.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70d6ddddbd983c7ca31715edb5f129b890a2b5b81e1ad947ba34d19d3b75131c"
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
