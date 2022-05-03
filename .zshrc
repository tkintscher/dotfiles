# Set window title
function set_window_title() {
    echo -ne "\033]0; $(basename "$PWD") \007"
}
precmd_functions+=(set_window_title)

# Locales (needed for mosh)
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Add Homebrew sbin to path
export PATH="/usr/local/sbin:$PATH"

# Load NVM
# Note: still need to call `nvm init` before using Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use

# Load Ruby
rbenv() {
    echo "Ruby env not loaded! Loading now..."
    unset -f rbenv
    which rbenv > /dev/null && eval "$(rbenv init -)"
    # Use Homebrew's (updated) OpenSSL with Ruby
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

    rbenv "$@"
}

# Setup starship prompt
eval "$(starship init zsh)"

# ZSH auto-completions
autoload -Uz compinit
# check cache only once a day
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

# Fancy ZSH improvements
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable fuzzy finder
FZF_DEFAULT_OPTS="--layout=reverse --border=rounded --info=inline"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

