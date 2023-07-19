/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/darricksmith/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


brew install gh
brew install neovim --HEAD
brew install --cask rectangle
brew install --cask wezterm
Brew install spotify_player

brew install elixir
git clone https://github.com/gusaiani/elixir-oh-my-zsh.git elixir

gh repo clone kencrocken/FiraCodeiScript

git config --global color.ui true
git config --global user.name "DB Smith"
git config --global user.email "smithwebdev@gmail.com"
ssh-keygen -t ed25519 -C "smithwebdev@gmail.com"

git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH_CUSTOM/plugins/zsh-vi-mode

brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

cd
git clone https://github.com/excid3/asdf.git ~/.asdf
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.zshrc
echo 'legacy_version_file = yes' >> ~/.asdfrc
exec $SHELL
brew install libyaml
asdf plugin add ruby
asdf plugin add nodes
asdf install ruby 3.2.2
asdf global ruby 3.2.2
gem update --system
which ruby
ruby -v
asdf install nodejs latest
asdf global nodejs latest
which node
node -v
npm I -g yarn

gem install rails 
rails -v

brew install sqlite3
brew install mysql
brew services start mysql
brew install postgresql@15
Brew services start postgresql@15
Brew install redis
Brew services start redis

Asdf plugin-add Erlang
Asdf plugin-add elixir
Asdf install Erlang latest
Asdf install elixir latest
Asdf global Erlang latest
Asdf global elixir latest

brew install jesseduffield/lazygit/lazygit
