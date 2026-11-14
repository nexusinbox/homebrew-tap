class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.0/nexusinbox-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "dbfa8fade1530f13066c8f3e25b72eeaf35b94037236d71c435aa8f77325ac17"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.0/nexusinbox-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "dee7f38db58668811cac0dc3dd65f3f310709ae52ee46c999a4cb62c8939e0e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.0/nexusinbox-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99ee2eb66e25b2ca2f887e73b843ca7c9f6c54333cb6e9b8b09f9563e368687c"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.0/nexusinbox-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f61d24d0c8425fac34198c21258249131e48b44ace8c324e59ddc539267115f"
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
