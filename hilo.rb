#!/usr/bin/env ruby
puts "Welcome to the Hi-Lo game."
puts "Guess a random number from 1 to 100 (inclusive)."
puts "You have 6 guesses."

random_num = rand(1..100)
puts "Please guess a number."

# only allow integer input
guess = gets
while guess.strip != guess.to_i.to_s  
    puts "Guess a number!"
    guess = gets
end
guess = guess.to_i

# comparing randomly generated number with user guess
if random_num == guess
    puts "You guessed correctly"
elsif guess < random_num
    puts "Your guess was too low!"
elsif guess > random_num
    puts "Your guess was too high!"
end
