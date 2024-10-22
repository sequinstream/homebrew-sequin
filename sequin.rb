class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  version "v0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-arm64.zip"
      sha256 "01ea7785b041c3b1f8fd756704654206db53e200a7a1bd894e2608bd26acc157" # tag:darwin-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-amd64.zip"
      sha256 "0a7fa58c2d1c5f0958e0da1fef504d7358ffcbc1ebff3ae6ac728f58e3ba50cd" # tag:darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-arm64.zip"
      sha256 "c111974c8d653f472c741127126309252a83f138ce871307a112247225453cb2" # tag:linux-arm64
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-amd64.zip"
      sha256 "83cd6618789bfe06b4a5550bfd77e53dd56787eaf61ed07e927a276ef43d3d6b" # tag:linux-amd64
    end
  end

  def install
    bin.install "sequin-cli-#{version}-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "sequin"
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end