class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.2/nexusinbox-0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "5f284573b42b13fe5f3e82ded137405913bae2346daaae080a1f3135adae69a3"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.2/nexusinbox-0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "2bfdff1b81d2b65765e9b978652cccfe3121b8a5ab899412cb9c0936f4cf5e8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.2/nexusinbox-0.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eafa5f7037c93af1a361215b020e9471b7e37d57886a851f732fe5f7b5b88115"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.2/nexusinbox-0.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53c80d26bc27050233c282b740410ae902816ee712703ccd8e2398396f523928"
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
