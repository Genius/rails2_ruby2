require "rails2_ruby2/version"

if Rails::VERSION::MAJOR == 2 && RUBY_VERSION >= '2.0.0'
  require 'rails2_ruby2/backport_ruby_config'
end

module Rails2Ruby2
end
