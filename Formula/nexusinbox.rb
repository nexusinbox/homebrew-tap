class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.3/nexusinbox-0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "1f91631ca83cf34512fb4fc94b43bc3825851659f5a725fc9f623c086ef3a736"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.3/nexusinbox-0.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "25b3090f7516b0c72d357fe42148cd97f7bfa3623fba0829e10ceaf1449a59bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.3/nexusinbox-0.9.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c4c8f87271e0c3758758861ba36cec34bc27187612ab7a732373b2d819ac8eb"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.3/nexusinbox-0.9.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48383f1457632b9e8e7036965aaba9f92823a3f8ac063545336404544d8ab79c"
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
