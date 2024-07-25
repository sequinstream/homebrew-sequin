class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  version "v0.2.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-arm64.zip"
      sha256 "8d4a7497ac8f9e680183afaf9c73ffc83984cba4e62c88b40fef07cfd7d2a4fc"
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-darwin-amd64.zip"
      sha256 "8d4a7497ac8f9e680183afaf9c73ffc83984cba4e62c88b40fef07cfd7d2a4fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-arm64.zip"
      sha256 "8d4a7497ac8f9e680183afaf9c73ffc83984cba4e62c88b40fef07cfd7d2a4fc"
    else
      url "https://github.com/sequinstream/sequin/releases/download/#{version}/sequin-cli-#{version}-linux-amd64.zip"
      sha256 "8d4a7497ac8f9e680183afaf9c73ffc83984cba4e62c88b40fef07cfd7d2a4fc"
    end
  end

  def install
    bin.install "sequin"
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end