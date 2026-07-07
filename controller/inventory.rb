require_relative '../Controller/authanticate_coltroller'



puts "Choose option"
puts "Enter 1 for Register"
puts "Enter 2 for Login"

input = gets.chomp.to_i

case input                                                                               

when 1 
    
    is_register = false
    if  !is_register

        puts "Enter your email "
        email = gets.chomp
    
        puts "Enter your password :"
        password = gets.chomp
    
        puts "choose your Role : \n Customer  \n Vendor"
        puts "Enter Role :"
        role = gets.chomp
    
        auth = Authanticate_controller.new
        register = auth.register( email, password, role)
 
        if register
          is_register = true
    
        else
            puts "not registered"
        end
         
    end

end