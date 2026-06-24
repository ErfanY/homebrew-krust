class Krust < Formula
  desc "Latency-first Kubernetes terminal navigator"
  homepage "https://github.com/ErfanY/krust"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-aarch64-apple-darwin.tar.gz"
      sha256 "a5854c1f349a353225a2495ac574139f4d185e5946e779a88168edc9ff600f4b"
    else
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-apple-darwin.tar.gz"
      sha256 "94c58ec1645816982671b0497cafda83563fd34ddba4d62f50048c00783a4c51"
    end
  end

  on_linux do
    url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5b331274529a7052e616822106dd52278dcd200920ccfb7da819c5498c419ad8"
  end

  def install
    bin.install "krust"
  end

  test do
    assert_match "krust", shell_output("#{bin}/krust --help")
  end
end
