class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  version "v0.2.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-arm64.zip"
      sha256 "b7950fb166421dcb1129008189e0c51dc9416c2df9b2e093f9ccc8215ea5b0bd" # tag:darwin-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-amd64.zip"
      sha256 "ccc9143c6c62369462745cdd8a91d2c117ed941f054437ada12cfd154b506b6b" # tag:darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-arm64.zip"
      sha256 "1a2783e1f8c17ef192b5e9359540b14596ed1393edcd40fdbb1b48f6f9fab650" # tag:linux-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-amd64.zip"
      sha256 "1b116c493883c9bff2c984ece2d705a0634361edd29e3b87a34f302b8ac47d1c" # tag:linux-amd64
    end
  end

  def install
    bin.install "sequin"
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end