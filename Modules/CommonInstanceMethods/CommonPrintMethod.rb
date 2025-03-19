module CommonPrintMethod

    def print
      puts "# ---------- #"
      puts
      puts "#{@entity} #{@values[:name]}"
      puts
      @values.each {|key, value| puts "#{key.capitalize}: #{value}" }
      puts
      puts "# ---------- #"
    end
  
end