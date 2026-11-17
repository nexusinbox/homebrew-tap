class Nexusinbox < Formula
  desc "Connect this computer to a NexusInbox agent"
  homepage "https://github.com/nexusinbox/nexusinbox"
  version "0.9.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.9/nexusinbox-0.9.9-aarch64-apple-darwin.tar.gz"
      sha256 "baf72b092ff420a4072b1055b4615ba6ce8138712e6cd5d89e5ccd1131cf8cd1"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.9/nexusinbox-0.9.9-x86_64-apple-darwin.tar.gz"
      sha256 "3e62bee2321aeba1bfedbd285a2a5ddc3f7d4018d5f1d9a049eae49d59f137d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.9/nexusinbox-0.9.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2806f6f4b67320f815ef656b52a6c99407039620b3dd7e4b392e9ca05c005c2"
    end
    on_intel do
      url "https://github.com/nexusinbox/nexusinbox/releases/download/v0.9.9/nexusinbox-0.9.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "11a4bb66d4838e81edf08b8f364e3cb15c44223f194f7fa424d6fd1087f3bb15"
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
