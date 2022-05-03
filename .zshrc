# Set window title
function set_window_title() {
    echo -ne "\033]0; $(basename "$PWD") \007"
}
precmd_functions+=(set_window_title)

# Locales (needed for mosh)
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

if [ `uname` = "Darwin" ]; then
    # MacOS specific stuff
    fzf_bin_dir=/usr/local/opt/fzf/bin
    fzf_shell_dir=/usr/local/opt/fzf/shell
    zsh_plugin_dir=/usr/local/share

    # Add Homebrew sbin to path
    [[ ! "$PATH" == */usr/local/sbin* ]] && export PATH="/usr/local/sbin:$PATH"

elif [ `uname` = "Linux" ]; then
    # Linux specific stuff
    fzf_bin_dir=/usr/bin
    fzf_shell_dir=/usr/share/fzf
    zsh_plugin_dir=/usr/share/zsh/plugins

fi

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
for plugin_name in \
    $zsh_plugin_dir/zsh-autosuggestions/zsh-autosuggestions.zsh \
    $zsh_plugin_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
do
    [ -f $plugin_name ] && source $plugin_name
done

# Enable fuzzy finder
FZF_DEFAULT_OPTS="--layout=reverse --border=rounded --info=inline"
[[ ! "$PATH" == *$fzf_bin_dir* ]] && export PATH="${PATH:+${PATH}:}$fzf_bin_dir"
[[ $- == *i* ]] && source "$fzf_shell_dir/completion.zsh" 2> /dev/null
source "$fzf_shell_dir/key-bindings.zsh"

