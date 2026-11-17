class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.11/nexusinbox-0.9.11-aarch64-apple-darwin.tar.gz"
      sha256 "0a8d3d128f0a85d665fd778ad8f1a5d9970af20105291d462136f0c2a9e92915"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.11/nexusinbox-0.9.11-x86_64-apple-darwin.tar.gz"
      sha256 "14b0a82532b2d1003d62f87bbb82bb5e7ac1ed6fa10255a5cd0f3b498005c0a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.11/nexusinbox-0.9.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a55d6eef101d54c46e4f321cd7748d7da4ef773491a431e30cd86c76fa7503b1"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.11/nexusinbox-0.9.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7d05c08a506c29d0e3861ff62077c3bf7924e5631ab69d80a5b41d16a1f55be"
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
