# Source .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Use 'vim' to launch nvim
alias vim="nvim"

# Use 'icat' to view images in kitty
alias icat="kitten icat"

# Set nvim as man pager
export MANPAGER="nvim +Man!"

# Add .NET tools to PATH
export PATH=":$PATH:~/.dotnet/tools"

# Fix Qt apps not running on Wayland
export QT_QPA_PLATFORM="wayland"

# zvm (zig version manager)
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"

export PATH=$PATH:/home/ccz/.spicetify


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/ccz/.opam/opam-init/init.sh' && . '/home/ccz/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration

# Created by `pipx` on 2024-09-13 13:05:57
export PATH="$PATH:/home/ccz/.local/bin"
