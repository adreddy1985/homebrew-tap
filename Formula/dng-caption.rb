class DngCaption < Formula
  include Language::Python::Virtualenv

  desc "AI-powered photo caption generator with Claude and OpenAI support"
  homepage "https://github.com/adreddy1985/dng-caption-tool"
  url "https://github.com/adreddy1985/dng-caption-tool/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "e1c7086b2115cda46a344c9628a3b33bb801f94cfeb79365b0f762c5e9a403b9"
  license "MIT"
  head "https://github.com/adreddy1985/dng-caption-tool.git", branch: "main"

  depends_on "exiftool"
  depends_on "python@3.11"

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
