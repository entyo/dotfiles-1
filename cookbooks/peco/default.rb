uname = run_command('uname').stdout.strip.downcase
github_binary 'peco' do
  repository 'peco/peco'
  version 'v0.5.1'
  ext = (node[:platform] == 'darwin' ? 'zip' : 'tar.gz')
  archive "peco_#{uname}_amd64.#{ext}"
  binary_path "peco_#{uname}_amd64/peco"
end
