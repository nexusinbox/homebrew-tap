class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.1/nexusinbox-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "52686937632010fc678ed42a5913935d03b30cc4d7354c967722b2013298cbe4"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.1/nexusinbox-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "0a06052982798fe82d7256c89bf9cef9a8006d03f514c98361a427dee21ba226"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.1/nexusinbox-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4063adf7e382c2c7cb0e8317554cd2a4bc746a80b5285f62ca9d521797a9e1da"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.8.1/nexusinbox-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "656714806c57ce7a0f844b57b3e3921379bfc4216d3e422fea8cd625b8e00228"
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
