class DngCaption < Formula
  desc "AI-powered photo caption generator with GPS location support"
  homepage "https://github.com/adreddy1985/dng-caption-tool"
  url "https://github.com/adreddy1985/dng-caption-tool/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"  # Update with actual SHA256
  license "MIT"
  version "2.1.0"

  depends_on "python@3.11"
  depends_on "exiftool"

  def install
    # Create virtual environment
    venv = virtualenv_create(libexec, "python3.11")
    
    # Install Python dependencies via pip
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", 
           "anthropic",
           "pillow",
           "piexif",
           "geopy",
           "exifread"
    
    # Install the package itself
    system libexec/"bin/pip", "install", "."
    
    # Create wrapper scripts
    (bin/"caption").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      exec "#{libexec}/bin/python" -c "
import sys
import os
sys.path.insert(0, '#{libexec}/lib/python3.11/site-packages')
from dng_caption.cli import main
sys.exit(main())
" "$@"
    EOS
    
    (bin/"caption-batch").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      exec "#{libexec}/bin/python" -c "
import sys
import os
sys.path.insert(0, '#{libexec}/lib/python3.11/site-packages')
from dng_caption.batch import main
sys.exit(main())
" "$@"
    EOS
    
    chmod 0755, bin/"caption"
    chmod 0755, bin/"caption-batch"
  end

  test do
    system "#{bin}/caption", "--help"
  end

  def caveats
    <<~EOS
      ✅ DNG Caption Tool installed!

      Set your API key:
        export ANTHROPIC_API_KEY="sk-ant-..."

      Usage:
        caption photo.jpg
        caption-batch ~/Photos/
    EOS
  end
end
