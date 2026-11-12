class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.3.0/nexusinbox-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "deed4f44f8e8f6cc1ed6a72c807a2826e3406728c1d5977bd072c161e888040c"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.3.0/nexusinbox-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "2f08c924bb3eaa523115e0d49da8a8b31b3eb0f1c2225127ed9031a09ea0edf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.3.0/nexusinbox-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f7223d6659b7d9c9bc4701bf4597ef871739d04f51928027bfcc73ed2a6bccd"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.3.0/nexusinbox-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f57f6943d74fe5b62b25808cb672a76dd7c2fc9fdec51d4df64ab3b7639049f"
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
