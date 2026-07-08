
class Vendor 
  
  def initialize(vendor_id, vendor_name)
  @vendor_id, @vendor_name =  vendor_id, vendor_name
  end


  def add_product(product_name, product_brand, price, product_type)
    
    file = File.open("products_list.txt", 'a') 

    if file 
      file.syswrite("vendor_id: #{@vendor_id}, product_name: #{product_name}, product_brand: #{product_brand}, price: #{price}, product_type: #{product_type}\n")
    end
  end


  def view_products()
     file = File.open("products_list.txt", 'r') 
      @product = []
    if file 
       file.each_line do |i|
        if i.chomp.strip != ""
           @product << i.chomp.strip.split(",")
        end
       end

      puts @product
    end
  end

  def remove_product(name)
    file = File.open("products_list.txt", 'r') 
      @products = []
    if file 
       file.each_line do |i|
        # if i.downcase.include?("product_name: #{name.downcase}")
           if i.chomp.strip != ""
           @products << i.chomp.strip.split(",")
        # end
        end
       end

      # print @product
    end

    file.close 

    @products.each_with_index do |i, index|
      
      if  i.to_s.include?("#{name}")
        file1 =  File.open("products_list.txt", 'w') 
      @products.delete(index)
      file.puts(@products)
      puts "product deleted!"

      file1.close
      break
    end

   end

  #  print @products
  end
#   
 
end

v= Vendor.new(1,"vendar1") 
# v.add_product("Laptop", "Asus", 49999, "Electronics")

v.remove_product("Laptop")
# v.view_products