require_relative "../../FrameworkClasses/PermissionReader"

module CommonReadMethod

    def read(fields)
        PermissionReader.has_permission?( @entity, fields, @values[:client], :read )
        @values.slice(*fields)
    end
end