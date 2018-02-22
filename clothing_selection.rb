require_relative "thing"
require_relative "thing_collection"
current_path = File.dirname(__FILE__)
puts "Сколько градусов за окном?"
temp = gets.chomp
puts temp

select = Thing_collection.new(current_path, temp)
select.print_set
