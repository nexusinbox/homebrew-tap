class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.1.0/nexusinbox-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "2df4aa42d8f31f93afddf3dc276cdc6eaa4d309d0dfe9fdb5ed118b35b40e8c3"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.1.0/nexusinbox-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6812422079832a47a264a700134dedb86bc1a7c9d122b84779b18a6dd9a70a8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.1.0/nexusinbox-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "368718619ef9e93e6abf766d23d679b8de101daa67e4288559eec6226d2c607f"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.1.0/nexusinbox-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce7650cee42ed341b06964b64deb970e940e36321f776325abe0c38ca50e8bc2"
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
