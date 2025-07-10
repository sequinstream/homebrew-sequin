class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  version "v0.12.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-arm64.zip"
      sha256 "44ff8a0122cfc0a51d09f3b4ad8c3bc538ba09bf8fdf0ba3ae7054cc50181a9c" # tag:darwin-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-amd64.zip"
      sha256 "0cbd893dbb51b3c3070df287507d9255639a9ea202b9c5c1cd5d4e0c26b80c5f" # tag:darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-arm64.zip"
      sha256 "2d4794244224f546e4b38786aae62047be6bc248c754dea494b0738859b89941" # tag:linux-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-amd64.zip"
      sha256 "290d4ac8277f3b411b0e0445071974d47bc1ab1045ef1a2480ebf6f1cfcf4cf3" # tag:linux-amd64
    end
  end

  def install
    bin.install "sequin-cli-#{version}-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "sequin"
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end