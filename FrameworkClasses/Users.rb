class Users
    
    @@users ||= {}

    def self.get
        @@users.keys
    end
    
    def self.create_or_update(user, password)
        @@users[user] = password
        puts "User \"#{user}\" was created or updated"
    end

    def self.get_user_password(user)
        @@users[user]
    end

end