class DngCaption < Formula
  include Language::Python::Virtualenv

  desc "AI-powered photo caption generator with GPS location support"
  homepage "https://github.com/adreddy/dng-caption-tool"
  url "https://github.com/adreddy/dng-caption-tool/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "f035328d349b5e3d1492a0b20dee0f5019cda6d9befed9f326cb377245266027"  # Update this with actual SHA256
  license "MIT"
  version "2.1.0"

  depends_on "python@3.11"
  depends_on "exiftool"

  # Python dependencies with CORRECT URLs
  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/66/17/8ee7c0529233b12714979a9db8c22a13eb0065ce0c8216e93c3e2a379a35/anthropic-0.39.0.tar.gz"
    sha256 "94671cc80765f9ce693f76d63a97ee9bef4c2d6063c044e983d21e2e262f60dc"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/e6/e3/c4c8d473d6780ef1853d630d581f70d655b4f8d7553c6997958c283616a2/anyio-4.4.0.tar.gz"
    sha256 "5aadc6a1bbb7cdb0bede386cac5e2940f5e2ff3aa20277e991cf028e0585ce94"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/b0/ee/9b19140fe824b367c04c5e1b369942dd754c4c5462d5674002f75c4dedc1/certifi-2024.8.30.tar.gz"
    sha256 "bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/f2/4f/e1808dc01273379acc506d18f1504eb2d299bd4131743b9fc54d7be4df1e/charset_normalizer-3.4.0.tar.gz"
    sha256 "223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3/distro-1.9.0.tar.gz"
    sha256 "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed"
  end

  resource "exifread" do
    url "https://files.pythonhosted.org/packages/5f/a6/e5bdca841e5cc1a0eb7b9bf64854a4bf4e19e6de1a14092f93b8c907e87a/exifread-3.0.0.tar.gz"
    sha256 "0ac5a364169dbdf2bd62f94f5c073970ab6694a3166177f5e448b10c943e2ca4"
  end

  resource "geographiclib" do
    url "https://files.pythonhosted.org/packages/59/b6/6afcf2b0268c71813e68be7a3b2a28d9d6a8870e6a13840c01853a40f83f/geographiclib-2.0.tar.gz"
    sha256 "f7f41c85dc3e1c2d3d935ec86660dc3b2c848c83e17f9a9e51ba9d5146a15859"
  end

  resource "geopy" do
    url "https://files.pythonhosted.org/packages/f5/50/e3a6008c8aeaf21a1dbeef891820a95054ee17e165c9e3dd8ec3132a8017/geopy-2.4.1.tar.gz"
    sha256 "50283d8e7ad07d89be5cb027338c6365a32044df3ae2556ad3f52f4840b3d0d1"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03/h11-0.14.0.tar.gz"
    sha256 "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/17/b0/5e8b8674f8d203335a62fdfcfa0d11ebe09e23613c3391033cbba35f7926/httpcore-1.0.5.tar.gz"
    sha256 "34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6/httpx-0.27.2.tar.gz"
    sha256 "f7c2be1d2f3c3c3160d441802406b206c2b76f5947b11115e6df10c6c65e66c2"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "jiter" do
    url "https://files.pythonhosted.org/packages/d7/1b/90d12a05655e4151f13c4d95f5e44ba11d827d2889ccc7e8a404c16e0498/jiter-0.7.0.tar.gz"
    sha256 "c061d9738535497b5509f8970584f20de1e900806b239a39a9994fc191dad630"
  end

  resource "piexif" do
    url "https://files.pythonhosted.org/packages/fa/84/4f09b3c3b6f3e7ea2b2e7aee2c1277064170d1041e5a58a557c138404913/piexif-1.1.3.zip"
    sha256 "83cb35c606bf3a1ea1a8f0a25cb42cf17e24353fd82e87ae3884e74ec531a314"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/cd/74/ad3d526f3bf7b6d3f408b73fde271ec69dfac8b81341a318ce825f2b3812/pillow-10.4.0.tar.gz"
    sha256 "166c1cd4d24309b30d61f79f4a9114b7b2313d7450912277855ff5dfd7cd4a06"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/df/e8/4f94ebd6972eff3babcea695d9c0a4dd5f8a4b269de25bb983200da81b18/pydantic-2.9.2.tar.gz"
    sha256 "d155cef71265d1e9807ed1c32b4c8deec042a44a50a4188b25ac67ecd81a9c0f"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/e2/aa/f42492ca968c8c88c8650e89c18c79a83ed3e5b01af5a9e87e7e04b5e4f0/pydantic_core-2.23.4.tar.gz"
    sha256 "2584f7cf844ac4d970fba483a717dbe10c1c1c96a969bf65d61ffe94df1b2863"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/ed/63/22ba4ebfe7430b76388e7cd448d5478814d3032121827c12a2cc287e2260/urllib3-2.2.3.tar.gz"
    sha256 "e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9"
  end

  def install
    virtualenv_install_with_resources

    # Create the main executable scripts
    (bin/"caption").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/lib/python3.11/site-packages:$PYTHONPATH"
      exec "#{libexec}/bin/python" -m dng_caption.cli "$@"
    EOS
    
    (bin/"caption-batch").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/lib/python3.11/site-packages:$PYTHONPATH"
      exec "#{libexec}/bin/python" -m dng_caption.batch "$@"
    EOS
    
    chmod 0755, bin/"caption"
    chmod 0755, bin/"caption-batch"
  end

  test do
    # Test that the commands exist
    assert_match "usage", shell_output("#{bin}/caption --help 2>&1", 2)
  end

  def caveats
    <<~EOS
      ✅ DNG Caption Tool installed successfully!

      📝 Setup:
      1. Set your Anthropic API key:
         export ANTHROPIC_API_KEY="sk-ant-your-key-here"

      2. Add to ~/.zshrc to make permanent:
         echo 'export ANTHROPIC_API_KEY="sk-ant-..."' >> ~/.zshrc

      📸 Usage:
         caption photo.jpg              # Generate caption
         caption-batch ~/Photos/         # Process folder
         caption photo.jpg --style social  # Social media style

      📚 Documentation:
         https://github.com/adreddy/dng-caption-tool
    EOS
  end
end
