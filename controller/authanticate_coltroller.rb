

class Authanticate_controller 
    @@count = 1
  
def register(email, password, role)
      file = File.open("../dao/regitered_users.txt", "a")

      if file 
            
        file.syswrite("#{email},#{password},#{role.downcase}")

      else
        puts "not"
      end

true
end
end