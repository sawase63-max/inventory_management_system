
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

  def check_email_password(email, password)
    file = File.open("/home/rails/Documents/project_inventory_management_system/dao/regitered_users.txt") 

  is_exist = false
  exist_role = ""
    
   if file
   file.each_line do |i| 

    exist_email, exist_password, role = i.downcase.split(",")

     if exist_email == email &&  exist_password == password 

      exist_role = role.chomp
       is_exist = true
     end

   end

   else 
    puts "file not exist!"
   end

  return is_exist, exist_role
  end
end


# print UserExist::login("vendor123@gmail.com","vendor@123")
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


  def login(email, password)
  
    is_login = check_email_password(email, password) 

    if is_login[0]
      return is_login

    else 
      return [false]
    end

  end
end

a = Authanticate_controller.new
# puts a.register("vendor123@gmail.com","vendor@123","vendor")

# puts a.login("vendor123@gmail.com","vendor@123")