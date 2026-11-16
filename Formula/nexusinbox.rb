class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.6/nexusinbox-0.9.6-aarch64-apple-darwin.tar.gz"
      sha256 "cac8a0ec2fc46efdfd3a3b8ecbadbc89a3421d931e9dc120ffac85e2d435461b"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.6/nexusinbox-0.9.6-x86_64-apple-darwin.tar.gz"
      sha256 "035e54d7b30854ee4c268dee01b866ae924438672390e2c161f9f009a76dcb97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.6/nexusinbox-0.9.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b01a2acbdc89cfe3f341cf722c258d86e63304d42f2603a35847878b1ca65d8"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.6/nexusinbox-0.9.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3bebcfa9a95ada6448d8e9ccfb8c34b589b2265c9b8f3a86c836078b90b88de"
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
