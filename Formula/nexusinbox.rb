class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.4/nexusinbox-0.9.4-aarch64-apple-darwin.tar.gz"
      sha256 "a3d8f381d92020f92df9749a0c75f88ba2878e47f6fa5fcfef5be9c5b9998bf5"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.4/nexusinbox-0.9.4-x86_64-apple-darwin.tar.gz"
      sha256 "453d38b1e1d7b6c91d23d9835fc84c2d423b96301853201f82afecc92bb3c4bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.4/nexusinbox-0.9.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c8a3b33a45e9baa09bdf808d37be7a32b8a48083cbc7f510d80339ecb7601445"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.4/nexusinbox-0.9.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "059481afeb65103dda674107b6530b7771759b152b4b2adeb743fc9be95de72a"
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
