class Captionsmith < Formula
  include Language::Python::Virtualenv

  desc "AI-powered photo caption generator for stock photography"
  homepage "https://github.com/adreddy1985/dng-caption-tool"
  url "https://github.com/adreddy1985/dng-caption-tool/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "e94052f9142b6579040adf6425a51312de6233336f98bdf91b74ea53644343c5"
  license "AGPL-3.0"
  head "https://github.com/adreddy1985/dng-caption-tool.git", branch: "main"

  depends_on "python@3.11"
  depends_on "exiftool"

  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/source/a/anthropic/anthropic-0.40.0.tar.gz"
    sha256 "3efeca6d9e97813f93ed34322c6c7ea2279bf0824cd0aa71f19d5a9691ddd571"
  end

  resource "openai" do
    url "https://files.pythonhosted.org/packages/source/o/openai/openai-1.57.0.tar.gz"
    sha256 "76f91971c4bdbd78380c9970581075e0337b5d497c2fbf7b5255078f4b31abf9"
  end

  resource "google-genai" do
    url "https://files.pythonhosted.org/packages/source/g/google-genai/google_genai-1.0.0.tar.gz"
    sha256 "15712abb808f891a14eafc9edf21b8cf92ea952f627dd0e2e939657efd234acd"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/source/p/pillow/pillow-11.0.0.tar.gz"
    sha256 "72bacbaf24ac003fea9bff9837d1eedb6088758d41e100c1552930151f677739"
  end

  resource "piexif" do
    url "https://files.pythonhosted.org/packages/source/p/piexif/piexif-1.1.3.tar.gz"
    sha256 "83cb35c606bf3a1ea1a8f0a25cb42cf17e24353fd82e87ae3884e74a302a5f1b"
  end

  resource "geopy" do
    url "https://files.pythonhosted.org/packages/source/g/geopy/geopy-2.4.1.tar.gz"
    sha256 "50283d8e7ad07d89be5cb027338571f5a1daf8f29052a0702c1a7b518461c8fb"
  end

  resource "exifread" do
    url "https://files.pythonhosted.org/packages/source/e/exifread/ExifRead-3.0.0.tar.gz"
    sha256 "0ac5a364169dbdf2bd62f94f5c073970ab6694a3f3a1538997563990b069963d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/captionsmith", "--help"
  end

  def caveats
    <<~EOS
      CaptionSmith - AI-powered photo captions for stock photography

      Set your API key for your chosen provider:

      Claude (Anthropic):
        export ANTHROPIC_API_KEY="sk-ant-..."
        Get your key at: https://console.anthropic.com

      OpenAI:
        export OPENAI_API_KEY="sk-..."
        Get your key at: https://platform.openai.com/api-keys

      Google Gemini:
        export GOOGLE_API_KEY="..."
        Get your key at: https://aistudio.google.com/apikey

      Add to your ~/.zshrc to make it permanent.

      Usage:
        captionsmith photo.jpg
        captionsmith photo.jpg --stock --stock-preset shutterstock
        captionsmith-batch ~/Photos/ --style travel
    EOS
  end
end
