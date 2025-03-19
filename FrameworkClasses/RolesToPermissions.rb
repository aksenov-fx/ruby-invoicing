class RolesToPermissions

    @@roles_to_permissions ||= {}
  
    def self.set(role, entity, operation, fields)
        @@roles_to_permissions[[role, entity]] ||= {}
        @@roles_to_permissions[[role, entity]][operation] = fields
    end
    
    def self.get(roles, entity)
        roles.map {|role| @@roles_to_permissions[[role, entity]] }
    end
  
end