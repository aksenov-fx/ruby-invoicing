class SalesOrder
    extend CommonClassMethods
    include CommonInstanceMethods
    
    ClassName ||= self.name.split('::').last.to_sym
    Log ||= Audit.new

    Structure ||= {
      name: "", 
      amount: 0,
      client: "", 
      recognized: false
    }

  # -------------------- #

    def self.validate_logic(new_values)
      return
    end
  
    def self.transition(values, fields)
      fields
    end

    def create_invoice(invoice_name)
      Invoice.new(
        {name: invoice_name, 
         amount: @values[:amount], 
         paid_amount: 0,
         client: @values[:client], 
         is_paid: false}
      )
    end

end