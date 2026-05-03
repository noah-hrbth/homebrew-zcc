class Zcc < Formula
  desc "Zed <-> Claude Code integration: send editor selection to Claude Code via /ide"
  homepage "https://github.com/noah-hrbth/zed-claude-code"
  version "0.2.2"
  license "MIT"

  on_arm do
    url "https://github.com/noah-hrbth/zed-claude-code/releases/download/v0.2.2/zcc-0.2.2-aarch64-apple-darwin.tar.gz"
    sha256 "7f7dae8705696d4b73c37e21a3e00f2cbe1af9ad12bc71c3afb7c797ab2de407"
  end

  on_intel do
    url "https://github.com/noah-hrbth/zed-claude-code/releases/download/v0.2.2/zcc-0.2.2-x86_64-apple-darwin.tar.gz"
    sha256 "f476f0be227561401fcd97e28d060a830feed7a4f2f357311183a3f380d5fbbd"
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
