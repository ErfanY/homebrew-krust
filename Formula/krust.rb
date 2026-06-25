class Krust < Formula
  desc "Latency-first Kubernetes terminal navigator"
  homepage "https://github.com/ErfanY/krust"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-aarch64-apple-darwin.tar.gz"
      sha256 "8315def499f7edc4eb81f410a9a89c99f4f7e3e533910485fda768cd368e5607"
    else
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-apple-darwin.tar.gz"
      sha256 "2670934aacec485794b034512d8ec3f0534234d6e4646d8be825818226883ebb"
    end
  end

  on_linux do
    url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1ee387a8a597e5f77cf77963ad641e2c4510fd01a2b358a8f655e95ac0d655da"
  end

  def install
    bin.install "krust"
  end

  test do
    assert_match "krust", shell_output("#{bin}/krust --help")
  end
end
