define :github_binary, version: nil, repository: nil, archive: nil, binary_path: nil do
  cmd = params[:name]
  bin_path = "#{ENV['HOME']}/bin/#{cmd}"

  execute "mkdir -p #{bin_path}" do
    not_if "test -e #{bin_path}"
  end

  archive = params[:archive]
  url = "https://github.com/#{params[:repository]}/releases/download/#{params[:version]}/#{archive}"

  if archive.end_with?('.zip')
    extract = "unzip -o"
  elsif archive.end_with?('.tar.gz')
    extract = "tar xvzf"
  else
    raise "unexpected ext archive: #{archive}"
  end

  execute "curl -fSL -o /tmp/#{archive} #{url}" do
    not_if "test -f #{bin_path}"
  end
  execute "#{extract} /tmp/#{archive}" do
    not_if "test -f #{bin_path}"
    cwd "/tmp"
  end
  execute "mv /tmp/#{params[:binary_path] || cmd} #{bin_path} && chmod +x #{path}" do
    not_if "test -f #{bin_path}"
  end
end