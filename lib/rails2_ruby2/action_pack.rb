Dir[File.dirname(__FILE__) + '/action_pack/**/*.rb'].each do |file|
  require file.chomp('.rb')
end