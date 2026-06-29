class Krust < Formula
  desc "Latency-first Kubernetes terminal navigator"
  homepage "https://github.com/ErfanY/krust"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-aarch64-apple-darwin.tar.gz"
      sha256 "a89c0e2206f8d5afb991138a918262e7c77f18bd3b810148493f5df7b8f64b35"
    else
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-apple-darwin.tar.gz"
      sha256 "2587c2d9f5571cb3e518accf45c6cdac2ded62961d31fee061c88cd5c5cfcacb"
    end
  end

  on_linux do
    url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "982dfee1bc969a47af612354e2b2d966ae600b612dff86ef240a3852836f07d6"
  end

  def install
    bin.install "krust"
  end

  test do
    assert_match "krust", shell_output("#{bin}/krust --help")
  end
end
