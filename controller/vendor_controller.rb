
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

 
end

v= Vendor.new(1,"vendar1") 
# v.add_product("Laptop", "Asus", 49999, "Electronics")

v.view_products