
module ProductsListModule


def view_products(file_path)
     file = File.open(file_path, 'r') 
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