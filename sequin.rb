class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  version "v0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-arm64.zip"
      sha256 "9612b312e1f7a22e0c52826c65f180628f96aac4a8ab278a872885cde9398b5e" # tag:darwin-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-amd64.zip"
      sha256 "6d6b102aa10351e20e240533040fe2c47a7c84b94b7df26e8cac092bbf6a327a" # tag:darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-arm64.zip"
      sha256 "c3875a0948dde0d578bcad82623d47dfc28f5a6b47b148668f5c51adc2d81d6c" # tag:linux-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-amd64.zip"
      sha256 "29892bfcd01ea299d9141c80426dfb1414b840642ec37f2217b6065b7df73c80" # tag:linux-amd64
    end
  end

  def install
    bin.install "sequin-cli-#{version}-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "sequin"
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end