# MacOSならbrewで入る
# https://github.com/anyenv/anyenv#manual-git-checkout
if node[:platform] != 'darwin'
  run_command("git clone https://github.com/anyenv/anyenv ~/.anyenv", error: false)
end

run_command("~/.anyenv/bin/anyenv init", error: false)