# Source .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Use 'vim' to launch nvim
alias vim="nvim"

# Set nvim as man pager
export MANPAGER="nvim +Man!"

# Add .NET tools to PATH
export PATH=":$PATH:~/.dotnet/tools"
