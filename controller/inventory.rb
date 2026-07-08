require_relative '/home/rails/Documents/project_inventory_management_system/controller/authanticate_controller.rb'


begin 
puts "\nChoose option"
puts "Enter 1 for Register"
puts "Enter 2 for Login"
puts "Enter 0 for exit"

input = gets.chomp.to_i

case input                                                                               

when 1 
    
    is_register = false
    if  !is_register

        puts "Enter your email "
        email = gets.chomp
    
        puts "Enter your password :"
        password = gets.chomp
    
        puts "choose your Role :"
        puts "1. for [customer]"
        puts "2. for [vendor]"
        puts "Enter number:"
        num= gets.chomp.to_i

        role = if num == 1
             "customer"
        else 
            "vendor"
        end
        puts role
        if role == "vendor" || role == "customer"
            auth = Authanticate_controller.new
            register = auth.register( email, password, role)
        else
            puts "\ninvalid role: #{role} \n please try again\n" 
            next
        end
    
 
        if register
          is_register = true
            puts "regestered successfully"
        else
            puts "not registered"
        end
         
    end

end
end while (input != 0)