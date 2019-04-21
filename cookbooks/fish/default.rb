link File.join(ENV['HOME'], ".config", "fish", "config.fish") do
    to File.expand_path("../../../config/config.fish", __FILE__)
end

# https://github.com/k0kubun/dotfiles/blob/master/cookbooks/zsh/default.rb#L1
if node[:platform] != 'darwin' 
  execute "chsh -s /usr/local/bin/fish #{node[:user]}" do
    only_if "getent passwd #{node[:user]} | cut -d: -f7 | grep -q '^/bin/bash$'"
    user 'root'
  end
end
