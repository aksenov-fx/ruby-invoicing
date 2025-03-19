require "awesome_print"
require_relative "../../FrameworkClasses/PermissionReader"

module CommonCreateMethods

    def initialize(values)
        @entity = self.class.name.split('::').last.to_sym # => :Invoice, :SalesOrder etc.
        create(values)
    end

    def create(values)                # ( entity,  fields,   client,          operation )
        PermissionReader.has_permission?(@entity, [:create], values[:client], :do_create )
        
        self.class.validate_data_structure( values )
        self.class.validate_logic(values)

        @values = values
        self.class::Log.insert(values, @values)
    
        puts "#{@entity} was created:"
        ap @values
    end
end