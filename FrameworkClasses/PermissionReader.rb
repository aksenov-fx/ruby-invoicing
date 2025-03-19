class PermissionReader

    def self.has_permission?( entity, fields, client, operation )
  
        roles_for_client = Permissions.get_roles(client) # [:Administrator, ...]
        roles_permissions = RolesToPermissions.get(roles_for_client, entity) # [{:do_create=>[:create], ... }, {:do_create=>[:create], ... }]
  
        roles_permissions = roles_permissions.reduce({}) do |acc, hash|
            acc.merge(hash) do |key, old_val, new_val|
            (old_val + new_val).uniq
            end
        end
    
        missing_permissions = fields - roles_permissions[operation]
    
        raise "Permission denied for #{Auth.current_user} to perform #{operation} on #{entity}
               Missing permissions: #{missing_permissions}" if missing_permissions != []; return
    
        end
  
end