class Krust < Formula
  desc "Latency-first Kubernetes terminal navigator"
  homepage "https://github.com/ErfanY/krust"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-aarch64-apple-darwin.tar.gz"
      sha256 "11585875131eaa7047ec1d88cfba5d265c1a2b7e98b83d0f7e537d2f41e4681e"
    else
      url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-apple-darwin.tar.gz"
      sha256 "7b9de7cc3ebbc0321095e928de3d905ab6dd3b3b3967b206637dd161ec7752ef"
    end
  end

  on_linux do
    url "https://github.com/ErfanY/krust/releases/download/v#{version}/krust-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "912c840c1228df01b280dacee27d0eba9d0e9a5efb2970281a8bc55fb7b1e725"
  end

  def install
    bin.install "krust"
  end

  test do
    assert_match "krust", shell_output("#{bin}/krust --help")
  end
end
