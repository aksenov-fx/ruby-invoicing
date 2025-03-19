require_relative "../FrameworkClasses/Users"

class Auth
    
    def self.current_user
        @@current_user
    end

    def self.login(user, password)
        if Users.get_user_password(user) == password 
            @@current_user = user
            puts "Logged in as #{user}"
        else
            "Wrong user/password"
        end
    end

end