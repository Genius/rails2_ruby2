Dir[File.dirname(__FILE__) + '/active_support/**/*.rb'].each do |file|
  require file.chomp('.rb')
end
