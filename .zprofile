# Add Homebrew to env
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add Cargo to path
export PATH="$HOME/.cargo/bin:$PATH"

