require 'active_record/connection_adapters/abstract/schema_statements'

ActiveRecord::ConnectionAdapters::SchemaStatements.module_eval do
  def dump_schema_information #:nodoc:
    sm_table = "public.#{ActiveRecord::Migrator.schema_migrations_table_name}"
    migrated = select_values("SELECT version FROM #{sm_table} ORDER BY version")
    migrated.map { |v| "INSERT INTO #{sm_table} (version) VALUES ('#{v}');" }.join("\n\n")
  end
end
