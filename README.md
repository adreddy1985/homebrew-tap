# Homebrew Tap for CaptionSmith

This is the official Homebrew tap for [CaptionSmith](https://github.com/adreddy1985/dng-caption-tool), an AI-powered photo caption generator for stock photography.

## Installation

```bash
brew tap adreddy1985/tap
brew install captionsmith
```

## Setup

After installation, set your API key for your preferred AI provider:

**Claude (Anthropic):**
```bash
export ANTHROPIC_API_KEY="sk-ant-..."
```

**OpenAI:**
```bash
export OPENAI_API_KEY="sk-..."
```

**Google Gemini:**
```bash
export GOOGLE_API_KEY="..."
```

Add the export to your `~/.zshrc` or `~/.bashrc` to make it permanent.

## Usage

```bash
# Caption a single image
captionsmith photo.jpg

# Stock photography mode with keywords
captionsmith photo.jpg --stock --stock-preset shutterstock

# Batch process a folder
captionsmith-batch ~/Photos/ --style travel

# Embed captions into JPEGs
captionsmith photo.jpg --embed
```

## Alternative Installation

You can also install via pip:

```bash
pip install captionsmith
```

See the [main repository](https://github.com/adreddy1985/dng-caption-tool) for details.

## More Information

- [Full Documentation](https://github.com/adreddy1985/dng-caption-tool)
- [Native macOS & iOS Apps](https://github.com/adreddy1985/dng-caption-tool#native-apps)

## License

CaptionSmith CLI is licensed under AGPL-3.0.
