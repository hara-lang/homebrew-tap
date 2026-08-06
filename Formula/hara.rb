class Hara < Formula
  desc "Programmable runtime-neutral kernel and HAL CLI"
  homepage "https://www.hara-lang.org"
  version "0.1.4"
  license "EPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hara-lang/hara/releases/download/v0.1.4/hara-rust-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "232f5b92e844bf497a174e2f928f776049b2943842514c117758a37f85519302"
    else
      url "https://github.com/hara-lang/hara/releases/download/v0.1.4/hara-rust-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "3dc283512e2bfb2b19b3a061a9aa07456627afccbc150d684b92fddff1e177c1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/hara-lang/hara/releases/download/v0.1.4/hara-rust-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aa5132c3efac13ab85d94fa8d6ffa6874f6479d124a90546bd5e2de15f8dcce2"
  end

  def install
    bin.install "hara"
  end

  test do
    assert_equal "42", shell_output("#{bin}/hara eval '(+ 19 23)'").strip
  end
end
