class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  version "v0.6.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-arm64.zip"
      sha256 "829134d193a80c9b727ce1f804100e63e49298d5f24bbbedb03de1dcca160982" # tag:darwin-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-amd64.zip"
      sha256 "9017b878e726295ddcce6fcc96841efb1a78a1f9e760dbedee28c34b8423e554" # tag:darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-arm64.zip"
      sha256 "072586e243ef217dc7c86138782c7df309b8afc78a9b3f64367d2e8d0ce7e9f2" # tag:linux-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-amd64.zip"
      sha256 "ab2f612081729d10d6b36b6ca8fbcec21783c00d217c8120d1927290732aeafa" # tag:linux-amd64
    end
  end

  def install
    bin.install "sequin-cli-#{version}-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "sequin"
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end