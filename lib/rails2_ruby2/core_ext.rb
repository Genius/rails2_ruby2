module Rails2Ruby2
  module CoreExt
  end
end

Dir[File.dirname(__FILE__) + '/core_ext/**/*.rb'].each do |file|
  require file.chomp('.rb')
end