Dir[File.dirname(__FILE__) + '/action_pack/**/*.rb'].each do |file|
  require file.sub(/#{Regexp.escape(File.extname(file))}$/, '')
end