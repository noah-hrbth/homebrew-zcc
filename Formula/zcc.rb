class Zcc < Formula
  desc "Zed <-> Claude Code integration: send editor selection to Claude Code via /ide"
  homepage "https://github.com/noah-hrbth/zed-claude-code"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/noah-hrbth/zed-claude-code/releases/download/v#{version}/zcc-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "02718d4230cc1527058f869f9a7363f8b840ddfa5cb3225dbda4fd54e1c6ae30"
  end

  on_intel do
    url "https://github.com/noah-hrbth/zed-claude-code/releases/download/v#{version}/zcc-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "c7210ee818d4a4450e96a1605fe2ef2e88308a45be77d5eccff8c5b12718af3e"
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
