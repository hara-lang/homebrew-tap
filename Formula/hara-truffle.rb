class HaraTruffle < Formula
  desc "Hara CLI built as a Truffle native image"
  homepage "https://www.hara-lang.org"
  version "0.1.4"
  license "EPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hara-lang/hara/releases/download/v0.1.4/hara-truffle-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "8757b80bf0a917092271a0aa8e1a35be61cfc82a93b981bd13f66a724849baf6"
    else
      url "https://github.com/hara-lang/hara/releases/download/v0.1.4/hara-truffle-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "56c8ff859939765b2c41c13c49d4bbbb77dcbb243a208683d8e229c8503e22f1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/hara-lang/hara/releases/download/v0.1.4/hara-truffle-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d4d952a2c1f3a7a88d13151b669bddd54131a1d73619d135ca27238e99a81e9e"
  end

  def install
    bin.install "hara-truffle"
  end

  test do
    assert_equal "42", shell_output("#{bin}/hara-truffle eval '(+ 19 23)'").strip
  end
end
