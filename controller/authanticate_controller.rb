
module UserExist 
  
  def email_exist?(email)
    file = File.open("/home/rails/Documents/project_inventory_management_system/dao/regitered_users.txt") 

  is_exist = false

   if file
   file.each_line do |i| 

     if email.downcase == i.downcase.split(",")[0]
        is_exist = true
     end
   end

  else 
    puts "file not exist!"
  end

  return is_exist
  end

 
end

class Authanticate_controller 
  include UserExist
  
def register(email, password, role)


  #  file = File.open("../dao/regitered_users.txt", "r") 
        is_exist = email_exist?(email)
   
        if is_exist == false
                    
      
                 file = File.open("/home/rails/Documents/project_inventory_management_system/dao/regitered_users.txt", "a") 

                if file 
                      
                  file.syswrite("#{email},#{password},#{role.downcase}\n")
                  return true
                else
                  puts "file not exist"
                end
        else
          puts "email aleady exist"
          return false
        end 

end

end

a = Authanticate_controller.new
puts a.register("vendor123@gmail.com","vendor@123","vendor")