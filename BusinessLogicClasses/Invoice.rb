require_relative '../Modules/CommonClassMethods'
require_relative '../Modules/CommonInstanceMethods'

class Invoice
    extend CommonClassMethods
    include CommonInstanceMethods
    
    Log ||= Audit.new
   
    Structure ||= {
      name: "", 
      amount: 0,
      paid_amount: 0,
      client: "",
      is_paid: false
    }
  
    # -------------------- #
  
    def self.validate_logic(new_values)
      if new_values[:amount] < 100
        raise "money is smol"
      end
    end
  
    def self.transition(values, fields)
      #is_paid = true/false, based on amount and paid_amount
      values[:amount] <= values[:paid_amount] ?
        fields.merge!(is_paid: true) :
        fields.merge!(is_paid: false)
    end
  
    def pay(sum)
      paid_amount = @values.slice(:paid_amount)
      paid_amount[:paid_amount] += sum
      update(paid_amount)
    end
  
end