class Krust < Formula
  desc "Latency-first Kubernetes terminal navigator"
  homepage "https://github.com/ErfanY/krust"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-aarch64-apple-darwin.tar.gz"
      sha256 "5e49cb27d3bdf542047f776aabf39c03caa4c4d40e2ab60b5e478fe46d8ea908"
    else
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-apple-darwin.tar.gz"
      sha256 "9b20f45855a02208ef2250735321091a3af847ac695ad1c54325a743c23f16b3"
    end
  end

  on_linux do
    url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8743487f5582048e0c2aa864df8708d186bf56ca04cf5fa8f197af07b204caf7"
  end

  def install
    bin.install "krust"
  end

  test do
    assert_match "krust", shell_output("#{bin}/krust --help")
  end
end
