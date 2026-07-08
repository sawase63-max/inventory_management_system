# require_relative '/home/rails/Documents/project_inventory_management_system/controller/authanticate_controller.rb'
require_relative '../controller/authanticate_controller.rb'
require_relative '..\controller\vendor_controller.rb'

$login = [false]


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

when 2 

        puts "Enter your email "
        email = gets.chomp
    
        puts "Enter your password :"
        password = gets.chomp

        auth = Authanticate_controller.new
        is_login = auth.login("vendor123@gmail.com","vendor@123")

        if is_login[0]
          puts "Log in successfully"
        print  $login = is_login
            break
        else 
            puts "inalid email/password"
        end

end



end while (input != 0) 


if $login[0]


    if $login[4] == "vendor"
        begin
        puts "\n---------------vendor dashboard----------------\n"
        puts "--------------------------------------------------"
        puts "-----------------------menu-----------------------\n"

        puts "Enter 1 for Add product"
        puts "Enter 2 for View all products"
        puts "Enter 3 for remove product"
        puts "Enter 4 for update products"
        puts "Enter 0 for log out"
        vendor_input = gets.chomp.to_i
        vendor = Vendor.new($login[1], $login[2])

        case vendor_input
        when 1 
           added = vendor.add_product("Laptop", "Asus",  49999, "Electronics") 
           puts "product added successfully" if added
           puts "product not added" if !added
       
        when 2
            vendor.view_products("../dao/products_list.txt")

        end

     
        end while(vendor_input != 0)
    end

     if $login[4] == "customer"
        
         puts "\n---------------customer dashboard----------------\n"
        puts "--------------------------------------------------"
        puts "-----------------------menu-----------------------\n"

        # puts "Enter 1 for Add product"
        puts "Enter 1 for View all products"
        puts "Enter 3 for remove product"
        puts "Enter 4 for update products"
        puts "Enter 0 for log out"
     end
     
end