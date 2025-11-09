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
    
    # Create the main wrapper script
    (bin/"caption").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      
      # Look for the main Python script
      if [[ -f "#{libexec}/batch_with_model.py" ]]; then
        exec "#{libexec}/bin/python" "#{libexec}/batch_with_model.py" "$@"
      elif [[ -f "#{libexec}/batch_caption_and_embed.py" ]]; then
        exec "#{libexec}/bin/python" "#{libexec}/batch_caption_and_embed.py" "$@"
      elif [[ -f "#{libexec}/main.py" ]]; then
        exec "#{libexec}/bin/python" "#{libexec}/main.py" "$@"
      elif [[ -f "#{libexec}/dng_caption/cli.py" ]]; then
        cd "#{libexec}" && exec "#{libexec}/bin/python" -m dng_caption.cli "$@"
      else
        echo "Error: No main script found. Available files:"
        ls -la "#{libexec}/"
        exit 1
      fi
    EOS
    
    (bin/"caption-batch").write <<~EOS
      #!/bin/bash
      export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-}"
      
      if [[ -f "#{libexec}/batch_caption_and_embed.py" ]]; then
        exec "#{libexec}/bin/python" "#{libexec}/batch_caption_and_embed.py" "$@"
      else
        exec "#{bin}/caption" "$@"
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
      find "#{libexec}" -name "*.py" -type f | head -10
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

      📸 Usage:
         caption photo.jpg
         caption-batch ~/Photos/

      If caption command fails, check:
      1. Run caption-test to see what's installed
      2. Check #{libexec} for Python files
      3. Ensure API key is set correctly
    EOS
  end
end
