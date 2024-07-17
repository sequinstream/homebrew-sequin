class Sequin < Formula
  desc "CLI tool for sequin"
  homepage "https://github.com/sequinstream/sequin"
  url "https://github.com/sequinstream/sequin.git", tag: "v0.2.2"
  head "https://github.com/sequinstream/sequin.git", branch: "main"

  depends_on "go" => :build

  def install
    cd "cli" do
      system "go", "build", *std_go_args(output: bin/"sequin")
    end
  end

  test do
    assert_match "sequin", shell_output("#{bin}/sequin --help")
  end
end