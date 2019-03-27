Dir[File.dirname(__FILE__) + '/active_record/**/*.rb'].each do |file|
  require file.chomp('.rb')
end