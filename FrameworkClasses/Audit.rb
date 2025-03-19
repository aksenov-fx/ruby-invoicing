class Audit

    def initialize
        @log = []
    end
  
    def insert(changed_fields, all_fields)
        @log << {
            name: all_fields[:name].dup.freeze,
            user: Auth.current_user.dup.freeze,
            changed_fields: changed_fields.dup.freeze,
            all_fields: all_fields.dup.freeze
        }
    end
  
    def select_entries(**fields)
        @log.each do |log_entry|
    
            print_log_entries(log_entry) if
                fields.all? { |key, value|
                log_entry[:changed_fields][key] == value }
    
        end; return
    end
  
    def print
        @log.each do | log_entry |
            print_log_entries(log_entry)
        end; return
    end
  
    def print_log_entries(log_entry)
        puts "#{log_entry[:user]} changed the following values for #{log_entry[:name]}:"
        ap log_entry[:changed_fields]
        
        puts "New values:"
        ap log_entry[:all_fields]
        puts
    end
  
    def clear_log
        @log = []
    end
  
end