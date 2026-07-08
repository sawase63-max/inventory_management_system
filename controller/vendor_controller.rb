require_relative '../controller/module/productsListModule.rb'
class Vendor 
  include ProductsListModule
  def initialize(vendor_id, vendor_name)
  @vendor_id, @vendor_name =  vendor_id, vendor_name
  end


  def add_product(product_name, product_brand, price, product_type)
    
 
  
    file_path = File.open("../dao/products_list.txt", "a")

    if file_path 
      file_path.syswrite("#{@vendor_id},#{product_name},#{product_brand},#{price},#{product_type}\n")
     return true
    else
      puts "file not found"
      return false
    end

  end
  
end

# v= Vendor.new(1,"vendar1") 
# v.add_product("Laptop", "Asus", 49999, "Electronics")

# v.view_products