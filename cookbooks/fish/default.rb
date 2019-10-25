execute "curl -L https://get.oh-my.fish | fish" do
  not_if "test -e #{ENV['HOME']}/.local/share/omf"
end

execute "ghq get git@github.com:powerline/fonts.git; $HOME/.ghq/github.com/powerline/fonts/install.sh"
execute "omf install agnoster | fish && omf theme agnoster | fish"

link File.join(ENV['HOME'], ".config", "fish", "config.fish") do
    to File.expand_path("../../../config/config.fish", __FILE__)
end

# https://github.com/k0kubun/dotfiles/blob/master/cookbooks/zsh/default.rb#L1
if node[:platform] != 'darwin' 
  execute "chsh -s /usr/bin/fish #{node[:user]}" do
    only_if "getent passwd #{node[:user]} | cut -d: -f7 | grep -q '^/bin/bash$'"
    user 'root'
  end
end
