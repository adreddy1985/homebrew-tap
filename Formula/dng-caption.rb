class DngCaption < Formula
  desc "AI-powered photo caption generator with GPS location support"
  homepage "https://github.com/adreddy1985/dng-caption-tool"
  url "https://github.com/adreddy1985/dng-caption-tool/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "cc0514bacaedba27c30f362a346c7f17ad536bb0a78985c44319a36d57fffa23"
  license "MIT"

  depends_on "python@3.11"
  depends_on "exiftool"

  def install
    # Use Homebrew's Python
    python = Formula["python@3.11"].opt_bin/"python3.11"
    
    # Create a virtual environment manually
    system python, "-m", "venv", libexec
    
    # Upgrade pip
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    
    # Install Python dependencies
    system libexec/"bin/pip", "install", "anthropic"
    system libexec/"bin/pip", "install", "pillow"
    system libexec/"bin/pip", "install", "piexif"
    system libexec/"bin/pip", "install", "geopy"
    system libexec/"bin/pip", "install", "exifread"
    
    # Install the dng_caption package from the nested structure
    # The source has: dng-caption-tool/src/dng_caption/*.py
    if Dir.exist?("dng-caption-tool/src/dng_caption")
      (libexec/"dng_caption").mkpath
      (libexec/"dng_caption").install Dir["dng-caption-tool/src/dng_caption/*.py"]

      # The package's __init__.py imports from .embed, but embed.py is at root level
      # Copy the root embed.py and batch.py to the package directory
      # (batch.py has relative imports so it needs to be in the package)
      (libexec/"dng_caption").install "embed.py"
      (libexec/"dng_caption").install "batch.py"
    end

    # Create simple launcher script for batch.py
    (libexec/"run_batch.py").write <<~PYTHON
      #!/usr/bin/env python
      """Launcher for batch.py that handles imports correctly"""
      import sys
      from dng_caption.batch import main

      if __name__ == "__main__":
          sys.exit(main())
    PYTHON

    # Create wrapper scripts
    # Note: batch.py handles BOTH caption generation AND embedding by default
    # Use --no-embed flag to generate captions without embedding

    (bin/"caption").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec "#{libexec}/bin/python" "#{libexec}/run_batch.py" "$@"
    EOS

    (bin/"caption-batch").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      # Generate captions only (no embedding)
      exec "#{libexec}/bin/python" "#{libexec}/run_batch.py" --no-embed "$@"
    EOS

    (bin/"caption-auto").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      # batch.py already does both caption generation AND embedding by default!
      exec "#{libexec}/bin/python" "#{libexec}/run_batch.py" "$@"
    EOS

    # Test script to verify installation
    (bin/"caption-test").write <<~EOS
      #!/bin/bash
      echo "🧪 DNG Caption Installation Test"
      echo "================================"
      echo ""
      echo "Python location: #{libexec}/bin/python"
      echo ""
      echo "Installed packages:"
      "#{libexec}/bin/pip" list | grep -E "anthropic|pillow|piexif|geopy|exifread" || echo "No packages found"
      echo ""
      echo "Python files found:"
      ls -la "#{libexec}/"*.py 2>/dev/null || echo "No .py files in root"
      echo ""
      echo "Testing Python imports:"
      "#{libexec}/bin/python" -c "
try:
    import anthropic
    print('✅ anthropic')
except: 
    print('❌ anthropic')
try:
    import PIL
    print('✅ PIL/pillow')
except:
    print('❌ PIL/pillow')
try:
    import piexif
    print('✅ piexif')
except:
    print('❌ piexif')
try:
    import geopy
    print('✅ geopy')
except:
    print('❌ geopy')
"
      echo ""
      if [[ -n "$ANTHROPIC_API_KEY" ]]; then
        echo "✅ API key is set"
      else
        echo "⚠️  API key not set. Run:"
        echo "    export ANTHROPIC_API_KEY='sk-ant-...'"
      fi
    EOS
    
    chmod 0755, bin/"caption"
    chmod 0755, bin/"caption-batch"
    chmod 0755, bin/"caption-auto"
    chmod 0755, bin/"caption-test"
  end

  test do
    assert_predicate bin/"caption", :exist?
    assert_predicate bin/"caption-test", :exist?
  end

  def caveats
    <<~EOS
      ✅ DNG Caption Tool installed!

      🧪 First, test your installation:
         caption-test

      📝 Set your API key:
         export ANTHROPIC_API_KEY="sk-ant-your-key-here"

      📸 Available commands:
         caption-auto ~/Photos/       # 🌟 Batch caption + auto embed (recommended!)
         caption-batch ~/Photos/      # Generate captions only (no embedding)
         caption ~/Photos/            # Same as caption-auto
         caption-test                 # Test installation

      💡 The caption-auto command is your all-in-one solution:
         - Generates captions for all images in a folder
         - Automatically embeds captions into JPEG files
         - Shows progress for each image

      If commands fail, check:
      1. Run caption-test to diagnose
      2. Ensure API key is set correctly
      3. Check file permissions
    EOS
  end
end
