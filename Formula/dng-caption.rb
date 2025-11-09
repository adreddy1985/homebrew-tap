class DngCaption < Formula
  desc "AI-powered photo caption generator with GPS location support"
  homepage "https://github.com/adreddy1985/dng-caption-tool"
  url "https://github.com/adreddy1985/dng-caption-tool/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "f035328d349b5e3d1492a0b20dee0f5019cda6d9befed9f326cb377245266027"
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
    
    # Copy all Python files to libexec
    libexec.install Dir["*.py"]
    
    # If there's a src directory, copy that too
    if Dir.exist?("src")
      (libexec/"src").mkpath
      (libexec/"src").install Dir["src/*.py"]
    end
    
    # If there's a dng_caption directory, copy that
    if Dir.exist?("dng_caption")
      (libexec/"dng_caption").mkpath
      (libexec/"dng_caption").install Dir["dng_caption/*.py"]
    end
    
    # Create the main wrapper script - UPDATED FOR YOUR FILE NAMES
    (bin/"caption").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      
      # Your main batch processing script
      if [[ -f "#{libexec}/batch.py" ]]; then
        exec "#{libexec}/bin/python" "#{libexec}/batch.py" "$@"
      else
        echo "Error: batch.py not found at #{libexec}/"
        ls -la "#{libexec}/"
        exit 1
      fi
    EOS
    
    (bin/"caption-batch").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      
      # Same as caption for batch processing
      exec "#{libexec}/bin/python" "#{libexec}/batch.py" "$@"
    EOS
    
    (bin/"caption-embed").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      export PYTHONPATH="#{libexec}:$PYTHONPATH"

      # Embed XMP into JPEGs
      if [[ -f "#{libexec}/embed.py" ]]; then
        exec "#{libexec}/bin/python" "#{libexec}/embed.py" "$@"
      else
        echo "Error: embed.py not found"
        exit 1
      fi
    EOS

    (bin/"caption-auto").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      export PYTHONPATH="#{libexec}:$PYTHONPATH"

      # Unified command: batch caption + auto embed
      echo "🎯 Step 1/2: Generating captions..."
      if [[ -f "#{libexec}/batch.py" ]]; then
        "#{libexec}/bin/python" "#{libexec}/batch.py" "$@"
        BATCH_EXIT=$?

        if [[ $BATCH_EXIT -ne 0 ]]; then
          echo "❌ Error during batch captioning (exit code: $BATCH_EXIT)"
          exit $BATCH_EXIT
        fi

        echo ""
        echo "✅ Captions generated successfully!"
        echo ""
        echo "🎯 Step 2/2: Embedding captions into JPEGs..."

        if [[ -f "#{libexec}/embed.py" ]]; then
          "#{libexec}/bin/python" "#{libexec}/embed.py" "$@"
          EMBED_EXIT=$?

          if [[ $EMBED_EXIT -ne 0 ]]; then
            echo "❌ Error during embedding (exit code: $EMBED_EXIT)"
            exit $EMBED_EXIT
          fi

          echo ""
          echo "✅ All done! Captions generated and embedded."
        else
          echo "⚠️  Warning: embed.py not found, skipping embedding step"
          exit 1
        fi
      else
        echo "Error: batch.py not found at #{libexec}/"
        ls -la "#{libexec}/"
        exit 1
      fi
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
    chmod 0755, bin/"caption-embed"
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
         caption-auto ~/Photos/       # 🌟 NEW: Batch caption + auto embed (recommended!)
         caption-batch ~/Photos/      # Generate captions only
         caption-embed ~/Photos/      # Embed XMP into JPEGs only
         caption-test                 # Test installation

      💡 The caption-auto command is your all-in-one solution:
         - Generates captions for all images in a folder
         - Automatically embeds captions from XMP into JPG files
         - Shows progress for each step

      If commands fail, check:
      1. Run caption-test to diagnose
      2. Ensure API key is set correctly
      3. Check file permissions
    EOS
  end
end
