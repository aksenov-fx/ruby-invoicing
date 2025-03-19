module CommonClassMethods

    def validate_data_structure(values)
      new_structure = values.each        { |k, v| values[k] = false if v == true }
      new_structure = values.map         { |k, v| {k => v.class} }
      old_structure = self::Structure.map{ |k, v| {k => v.class} }

      mismatches    = new_structure - old_structure
      raise "Unexpected key or value type: #{mismatches}" if mismatches != []
    end

end