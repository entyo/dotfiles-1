uname = run_command('uname').stdout.strip.downcase
github_binary 'ghq' do
  repository 'motemen/ghq'
  version 'v0.8.0'
  archive "ghq_#{uname}_amd64.zip"
end
