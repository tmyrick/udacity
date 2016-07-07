require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)
items = products_hash["items"]

# Print today's date
puts "Today's Date: #{Time.now.strftime('%v')}"

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

# For each product in the data set:
items.each do |toy|

  # Print the name of the toy
  puts "\n" + "Toy: #{toy["title"]}"

  # Print the retail price of the toys
  retail_price = toy["full-price"].to_f
  puts "Retail Price: $#{'%.2f' % retail_price}"

  # Calculate and print the total number of purchases
  purchases = toy["purchases"]
  puts "Number of Purchases: #{purchases.count}"

  # Calculate and print the total amount of sales
  sales = 0.0
  toy["purchases"].each do |purchase|
    sales = sales + purchase["price"]
  end

  puts "Total Sales: $#{'%.2f' % sales}"

  # Calculate and print the average price the toy sold for
  avg_price = sales / purchases.count
  puts "Average Price: $#{'%.2f' % avg_price}"

  # Calculate and print the average discount (% or $) based off the average sales price
  avg_discount = retail_price - avg_price
  puts "Average Discount: $#{'%.2f' % avg_discount.to_f}"
end

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# Define each brand 
uniq_brand = items.map{|product| product["brand"]}.uniq

# For each brand in the data set:
uniq_brand.each do |brand_name|
  each_brand = items.select {|item| item["brand"] == brand_name}

  # Print the name of the brand
  puts "\n" + "Brand: #{brand_name}"

  # Setup some variables to provide aggregate data for all of the brands toys
  total_toys = 0
  total_stock = 0
  total_price = 0.0
  total_sales = 0
  revenue = 0

  
  each_brand.each do |brand|
    total_toys += 1
    total_stock = total_stock + brand["stock"]
    total_price = total_price + brand["full-price"].to_f

    # Setup a loop for each toy's purchase price
    brand["purchases"].each do |purchase|
      revenue = revenue + purchase["price"]
    end

  end


  # Count and print the number of the brand's toys we stock
  puts "Total Stock: #{total_stock}" 

  # Calculate and print the average price of the brand's toys
  puts "Average Price: $#{'%.2f' % (total_price / total_toys)}"

  # Calculate and print the total revenue of all the brand's toy sales combined
  puts "Total Revenue: $#{'%.2f' % revenue}"

end

