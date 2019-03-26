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

  # Resets the sequence of a table's primary key to the maximum value.
  def reset_pk_sequence!(table, pk = nil, sequence = nil) #:nodoc:
    unless pk and sequence
      default_pk, default_sequence = pk_and_sequence_for(table)

      pk ||= default_pk
      sequence ||= default_sequence
    end

    if @logger && pk && !sequence
      @logger.warn "#{table} has primary key #{pk} with no default sequence"
    end

    if pk && sequence
      quoted_sequence = quote_table_name(sequence)
      max_pk = select_value("SELECT MAX(#{quote_column_name pk}) FROM #{quote_table_name(table)}")
      if max_pk.nil?
        if postgresql_version >= 100000
          minvalue = select_value("SELECT seqmin FROM pg_sequence WHERE seqrelid = #{quote(quoted_sequence)}::regclass")
        else
          minvalue = select_value("SELECT min_value FROM #{quoted_sequence}")
        end
      end

      select_value <<-end_sql, 'SCHEMA'
      SELECT setval(#{quote(quoted_sequence)}, #{max_pk ? max_pk : minvalue}, #{max_pk ? true : false})
      end_sql
    end
  end
end
