require 'active_record/connection_adapters/postgresql_adapter'

ActiveRecord::ConnectionAdapters::PostgreSQLColumn.class_eval do
  class << self
    def extract_value_from_default_with_negative_integer_support(default)
      if default =~ /\A'(-?\d+(\.\d*)?\)?)'::integer\z/i
        $1
      else
        extract_value_from_default_without_negative_integer_support(default)
      end
    end

    alias_method_chain :extract_value_from_default, :negative_integer_support
  end
end
