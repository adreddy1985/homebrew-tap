class DngCaption < Formula
  include Language::Python::Virtualenv

  desc "AI-powered photo caption generator with Claude and OpenAI support"
  homepage "https://github.com/adreddy1985/dng-caption-tool"
  url "https://github.com/adreddy1985/dng-caption-tool/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "0e2044b1d5400223b49405cabaf0b15e2ace2e16129606a6bbd1cec51ec130ad"
  license "MIT"
  head "https://github.com/adreddy1985/dng-caption-tool.git", branch: "main"

  depends_on "exiftool"
  depends_on "python@3.11"

  # Fix setup.py to find README.md in the nested subdirectory
  patch :DATA

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"dng-caption", "--help"
  end

  def caveats
    <<~EOS
      To use this tool, set your API key for your chosen provider:

      For Claude (default):
        export ANTHROPIC_API_KEY="sk-ant-..."
        Get your key at: https://console.anthropic.com

      For OpenAI:
        export OPENAI_API_KEY="sk-..."
        Get your key at: https://platform.openai.com/api-keys

      Add to your ~/.zshrc to make it permanent.

      Usage:
        dng-caption photo.jpg --provider claude
        dng-caption photo.jpg --provider openai --model gpt-4o
    EOS
  end
end

__END__
--- a/setup.py
+++ b/setup.py
@@ -9,7 +9,7 @@ from pathlib import Path

 # Read the README file
 this_directory = Path(__file__).parent
-long_description = (this_directory / "README.md").read_text()
+long_description = (this_directory / "dng-caption-tool" / "README.md").read_text()

 setup(
     name="dng-caption",
