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

  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/5c/d2/fee4d3ac4e72e64bf41febc8382954893ab533010123db4e2aea895f0dea/anthropic-0.18.0.tar.gz"
    sha256 "80a6134f6562792be8ec30f743e2211476cb1e1f59b01795b901f099ae854825"
  end

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/0f/8b/2ebaf9adcf4260c00f842154865f8730cf745906aa5dd499141fb6063e26/Pillow-10.0.0.tar.gz"
    sha256 "9c82b5b3e043c7af0d95792d0d20ccf68f61a1fec6b3530e718b688422727396"
  end

  resource "piexif" do
    url "https://files.pythonhosted.org/packages/fa/84/a3f25cec7d0922bf60be8000c9739d28d24b6896717f44cc4cfb843b1487/piexif-1.1.3.zip"
    sha256 "83cb35c606bf3a1ea1a8f0a25cb42cf17e24353fd82e87ae3884e74a302a5f1b"
  end

  resource "geopy" do
    url "https://files.pythonhosted.org/packages/b5/a7/3f45be21951e48e0f367b1c87b7e00d3a9cd054bee8b6e13a35b0f652c6f/geopy-2.3.0.tar.gz"
    sha256 "228cd53b6eef699b2289d1172e462a90d5057779a10388a7366291812601187f"
  end

  resource "ExifRead" do
    url "https://files.pythonhosted.org/packages/20/64/e8f40966ca766173fe57cc4de7d35492cf18949ced8b612924d48fa1d297/ExifRead-3.0.0.tar.gz"
    sha256 "0ac5a364169dbdf2bd62f94f5c073970ab6694a3166177f5e448b10c943e2ca4"
  end

  # Transitive dependencies for anthropic
  resource "anyio" do
    url "https://files.pythonhosted.org/packages/db/4d/3970183622f0330d3c23d9b8a5f52e365e50381fd484d08e3285104333d3/anyio-4.3.0.tar.gz"
    sha256 "f75253795a87df48568485fd18cdd2a3fa5c4f7c5be8e5e36637733fce06fed6"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3/distro-1.9.0.tar.gz"
    sha256 "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6/httpx-0.27.0.tar.gz"
    sha256 "a0cb88a46f32dc874e04ee956e4c2764aba2aa228f650b06788ba6bda2962ab5"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/43/5f/e53e10aeb1ddd27424e0818c944ca0df8549cb0f5ff3e01bf4c3dd09a14b/pydantic-2.6.4.tar.gz"
    sha256 "b1704e0847db01817624a6b86766967f552dd9dbf3afba4004409f908dcc84e6"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "tokenizers" do
    url "https://files.pythonhosted.org/packages/48/c1/6b222d2a0ad5ff2c9181e5b29b93a6b3d0e374f8bbd918ba1d4ff3fb5b58/tokenizers-0.15.2.tar.gz"
    sha256 "e6e9c6e019dd5484be5beafc775ae6c925f4c69a3487040ed09b45e13df2cb91"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/0c/1d/eb26f5e75100d531d7399ae800814b069bc2ed2a7410834d57374d010d96/typing_extensions-4.9.0.tar.gz"
    sha256 "23478f88c37f27d76ac8aee6c905017a143b0b1b886c3c9f66bc2fd94f9f5783"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/17/b0/5e8b8674f8d203335a62fdfcfa0d11ebe09e23613c3391033cbba35f7926/httpcore-1.0.5.tar.gz"
    sha256 "34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03/h11-0.14.0.tar.gz"
    sha256 "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/71/da/e94e26401b62acd6d91df2b52954aceb7f561743aa5ccc32152886c76c96/certifi-2024.2.2.tar.gz"
    sha256 "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/5c/cc/07bec3fb337ff80eacd6028745bd858b9642f61ee58cfdbfb64451c1def0/pydantic_core-2.16.3.tar.gz"
    sha256 "1cac689f80a3abab2d3c0048b29eea5751114054f032a941a32de4c852c59cad"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/67/fe/8c7b275824c6d2cd17c93ee85d0ee81c090285b6d52f4876ccc47cf9c3c4/annotated_types-0.6.0.tar.gz"
    sha256 "563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d"
  end

  resource "geographiclib" do
    url "https://files.pythonhosted.org/packages/0c/02/00088f85d8e2fb5e3ef5e45bc499c87a9e7ad8988cf1f0b0cf74f662e854/geographiclib-2.0.tar.gz"
    sha256 "f4fe9a2bf8d1e2df4cf5dafedd8afbf8cdc85fa8af7990e01f3096e8cff59fbb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/dng-caption", "--help"
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
