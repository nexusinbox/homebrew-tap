class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.4.0/nexusinbox-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "83fc92ac5d525939fd9fc68695d634d0404446015dd667e17df1452042568aff"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.4.0/nexusinbox-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "d5f0f927e2a55271f60b7e7c30813de3cd2f5e8467843d94a5374f52cc93eedc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.4.0/nexusinbox-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e153767bddfc1301b95521926dec7a9dfddc0bd03814e4dd3ce8f320476ecbce"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.4.0/nexusinbox-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b690b9d99467317fee2490f51dae1ccb7cf60358da5220d30861baaa1d21628d"
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
