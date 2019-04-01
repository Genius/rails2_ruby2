require 'yaml'

module Rails2Ruby2::CoreExt::ObjectYamlAsSyckCompatibility
  def self.included(base)
    unless Object.respond_to? :yaml_as
      base.class_eval do
        class << self
          alias_method :yaml_as, :yaml_tag
        end
      end
    end
  end
end

Object.send(:include, Rails2Ruby2::CoreExt::ObjectYamlAsSyckCompatibility)
