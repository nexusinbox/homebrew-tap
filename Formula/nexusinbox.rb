class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.5/nexusinbox-0.9.5-aarch64-apple-darwin.tar.gz"
      sha256 "9fc3ba961372e26770306c98f384a9fd97f7fa2c8465b5401083d3cb22a6922b"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.5/nexusinbox-0.9.5-x86_64-apple-darwin.tar.gz"
      sha256 "0648badc813ce9c648069cf57c2a1c5dd764e243fbb1c10b2dbb869487ece777"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.5/nexusinbox-0.9.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14ee9a207ba4308adec32a33717809679a9795dd38037f62114914e75b77f645"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.5/nexusinbox-0.9.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "986d76c13958484bd23235df6bcba585c57f1948c4dfa35c13a2cb6f63a570f3"
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
