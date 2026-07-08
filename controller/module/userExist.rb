
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