class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequin-io/sequin-cli"
  url "https://github.com/sequin-io/sequin-cli.git", tag: "v0.1.1"
  head "https://github.com/sequin-io/sequin-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"sequin")
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end
