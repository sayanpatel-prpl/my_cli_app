require './actions'
include Actions


system('clear')
puts "Hey there, Welcome to my CLI Application. Lets hope we have fun here."
puts "Please enter your name:"
@name = gets.chomp
@texts = []
select_roles
