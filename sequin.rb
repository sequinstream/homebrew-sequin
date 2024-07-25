class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  version "v0.2.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/v#{version}/sequin-cli-#{version}-darwin-arm64.zip"
      sha256 "12bb95ccc3a6fc218cbc9bbc35b5b8cfdaf9e08a0926fe3ab4cfc832918459ac"
    else
      url "https://github.com/sequinstream/sequin/releases/download/v#{version}/sequin-cli-#{version}-darwin-amd64.zip"
      sha256 "2c0a7257a0312c0258863bce2dd6a83861c8748fb130018dddaadcfe952fec0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sequinstream/sequin/releases/download/v#{version}/sequin-cli-#{version}-linux-arm64.zip"
      sha256 "a9c3bada4d77bede1541ea272f0df7846308ece4ebca7bf7c036810124d96613"
    else
      url "https://github.com/sequinstream/sequin/releases/download/v#{version}/sequin-cli-#{version}-linux-amd64.zip"
      sha256 "bc5c0de0ebb0ffecf914e90806570c222671395349e782b85dcbaf0bb8e2936f"
    end
  end

  def install
    bin.install "sequin"
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end