Dir[File.dirname(__FILE__) + '/active_record/**/*.rb'].each do |file|
  require file.sub(/#{Regexp.escape(File.extname(file))}$/, '')
end