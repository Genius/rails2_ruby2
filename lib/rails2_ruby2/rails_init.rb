when_library_loaded('ActiveSupport', :version_file => 'active_support/version') do
  require 'rails2_ruby2/i18n_patch'
  require 'rails2_ruby2/compressed_memcached_store_patch'
  require 'rails2_ruby2/erb_util_silence'
end

when_library_loaded('ActionController',
   :lib_const_string => 'ActionPack', :version_file => 'action_pack/version') do
  require 'rails2_ruby2/named_route_collection_patch'
  # require 'rails2_ruby2/action_controller_perform_action_patch'
end
