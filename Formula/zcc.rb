class Zcc < Formula
  desc "Zed <-> Claude Code integration: send editor selection to Claude Code via /ide"
  homepage "https://github.com/noah-hrbth/zed-claude-code"
  version "0.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/noah-hrbth/zed-claude-code/releases/download/v0.3.0/zcc-0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "bcc7a3f5dade33fa4123964e8469348e02eeb8bfbe586faab04b9a2d9f7b0646"
  end

  on_intel do
    url "https://github.com/noah-hrbth/zed-claude-code/releases/download/v0.3.0/zcc-0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "c4fab046d17de9d94b5147308b77a00562461fff9b8686b708ad8e9d28120cdf"
  end

  def install
    bin.install "zcc"
  end

  def caveats
    <<~EOS
      To finish setup, run:
        zcc install

      That merges an entry into your Zed tasks.json and keymap.json
      so Cmd+L sends the editor selection to Claude Code.

      Originals are backed up alongside each file as *.bak.
    EOS
  end

  test do
    assert_match "zcc #{version}", shell_output("#{bin}/zcc --version")
    assert_match "Send the current editor selection", shell_output("#{bin}/zcc send --help")
    assert_match "zcc doctor", shell_output("#{bin}/zcc doctor")
  end
end
