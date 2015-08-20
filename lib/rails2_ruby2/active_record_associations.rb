module ActiveRecord
  module Associations
    class AssociationProxy
      def proxy_respond_to?(method, include_all = false)
        Object.instance_method(:respond_to?).bind(self).call(method, include_all) ||
          (!include_all && Object.instance_method(:protected_methods).bind(self).call.include?(method))
      end

      private

      # Forwards any missing method call to the \target.
      def method_missing(method, *args, &block)
        if load_target
          if @target.respond_to?(method) || @target.protected_methods.include?(method)
            @target.send(method, *args, &block)
          else
            super
          end
        end
      end
    end

    class AssociationCollection < AssociationProxy
      def proxy_respond_to?(method, include_all = false)
        super ||
          @reflection.klass.respond_to?(method, include_all) ||
          (!include_all && @reflection.klass.protected_methods.include?(method))
      end
    end
  end
end


module ActiveRecord::AutosaveAssociation
  private

  def save_collection_association(reflection)
    if association = association_instance_get(reflection.name)
      autosave = reflection.options[:autosave]

      if records = associated_records_to_validate_or_save(association, @new_record_before_save, autosave)
        records.each do |record|
          next if record.destroyed?

          if autosave && record.marked_for_destruction?
            association.destroy(record)
          elsif autosave != false && (@new_record_before_save || record.new_record?)
            if autosave
              saved = association.send(:insert_record, record, false, false)
            else
              association.send(:insert_record, record)
            end
          elsif autosave
            saved = record.save(false)
          end

          raise ActiveRecord::Rollback if saved == false
        end
      end

      # reconstruct the SQL queries now that we know the owner's id
      association.send(:construct_sql) if association.respond_to?(:construct_sql, true)
    end
  end
end
