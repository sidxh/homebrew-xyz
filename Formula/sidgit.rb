# sidgit.rb
class Sidgit < Formula
  desc "A simple Git clone written in Go"
  homepage "https://github.com/sidxh/sidgit-go"
  # This URL comes from the release you created in Step 2
  url "https://github.com/sidxh/sidgit-go/archive/refs/tags/v0.1.0.tar.gz"
  # You get this by downloading the .tar.gz and running: shasum -a 256 v0.1.0.tar.gz
  sha256 "5c28417641d7b400283acdc68bf03455faf9f6a642ea5f6da4a2a110db8dc080"
  license "MIT" # Or whatever license you choose

  # This tells Homebrew it needs Go to build your package.
  depends_on "go" => :build

  def install
    # This is the crucial part. These are the shell commands Homebrew will run.
    # It tells Go to build from the cmd/sidgit-go directory and output a binary named "sidgit"
    system "go", "build", "-o", "sidgit", "./cmd/sidgit-go"

    # This command installs the compiled "sidgit" binary into the user's cellar.
    bin.install "sidgit"
  end

  test do
    # A simple test to verify the installation was successful.
    assert_match "Usage:", shell_output("#{bin}/sidgit --help")
  end
end
