require_relative "CommonInstanceMethods/CommonCreateMethods"
require_relative "CommonInstanceMethods/CommonReadMethod"
require_relative "CommonInstanceMethods/CommonUpdateMethod"
require_relative "CommonInstanceMethods/CommonPrintMethod"

module CommonInstanceMethods
    include CommonCreateMethods
    include CommonReadMethod
    include CommonUpdateMethod
    include CommonPrintMethod
end