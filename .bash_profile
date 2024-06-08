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
