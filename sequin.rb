class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  version "v0.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-arm64.zip"
      sha256 "05411b73fc11f3a578c15ade14dd6499cb51beaa47786582b7d365e3f9eb5834" # tag:darwin-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-amd64.zip"
      sha256 "fb3e15dc2006bbcb8e4121fd750f02f78dd1ed95115c438223e4750e78202713" # tag:darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-arm64.zip"
      sha256 "f3588af2d05b5ca6904b8db430aff61d9f6ec535e3ccb3493b57044a83d3c653" # tag:linux-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-amd64.zip"
      sha256 "aaf1a9c49f7c113a6cbf776d4def4625c1b4db45974287fb4cd7e12edc6242bf" # tag:linux-amd64
    end
  end

  def install
    bin.install "sequin-cli-#{version}-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "sequin"
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end