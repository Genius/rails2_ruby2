ActiveRecord::ConnectionAdapters::SchemaStatements.module_eval do
  def dump_schema_information #:nodoc:
    sm_table = "public.#{ActiveRecord::Migrator.schema_migrations_table_name}"
    migrated = select_values("SELECT version FROM #{sm_table} ORDER BY version")
    migrated.map { |v| "INSERT INTO #{sm_table} (version) VALUES ('#{v}');" }.join("\n\n")
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.class_eval do
  def schema_search_path
    @schema_search_path ||= query('SHOW search_path')[0][0].split(',').map(&:strip).join(',')
  end
end
