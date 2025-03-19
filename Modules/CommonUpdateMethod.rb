module CommonUpdateMethod

    def update(fields)
  
    #[1] Define an updated state
      new_values = @values.merge(fields)
  
    #[2] Check permissions and validation
      PermissionReader.has_permission?( @entity, fields.keys, @values[:client], :update )
  
      self.class.validate_data_structure(new_values)
      fields = self.class.transition(new_values, fields)
      self.class.validate_logic(new_values)
  
    #[3] Update entity with new values and write audit
    
      #exclude fields that did not change
      fields = fields.reject { |key, value| @values[key] == value }
  
      @values.merge!(fields)
      self.class::Log.insert(fields, @values)
  
    #[4] Print result
      puts "#{@entity} was updated. New values:"
      ap @values
  
    end
end