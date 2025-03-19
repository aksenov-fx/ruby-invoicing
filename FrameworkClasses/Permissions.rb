class Permissions

    @@Permissions ||= {}

    def self.add(user, client, role)
        @@Permissions[[user, client]] ||= []
        @@Permissions[[user, client]] << role unless @@Permissions[[user, client]].include?(role)
    end

    def self.get
        @@Permissions
    end

    def self.get_roles(client)
        raise "#{Auth.current_user} does not have a defined role for client #{client}" unless @@Permissions[[Auth.current_user, client]] 
        @@Permissions[[Auth.current_user, client]]
    end
  
end