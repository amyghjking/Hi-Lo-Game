#!/usr/bin/env ruby
puts "Welcome to the Hi-Lo game.\nGuess a random whole number from 1 to 100 (inclusive)."
puts "You will have a total of 6 guesses."
puts ""

random_num = rand(1..100)

# gives the user 6 guesses
for i in 0..5
    guesses_left = 6 - i
    puts "You have #{guesses_left} guesses left."
    puts "Please guess a whole number."

    # only allow integer input
    guess = gets
    while guess.strip != guess.to_i.to_s  
        puts "Guess a whole number!"
        guess = gets
    end
    guess = guess.to_i

    # comparing randomly generated number with user guess
    if random_num == guess
        puts "\nYou guessed correctly and won the game!"
	return
    elsif guess < random_num
        puts "\nYour guess was too low!"
    elsif guess > random_num
        puts "\nYour guess was too high!"
    end
end

puts "\nYou made 6 incorrect guesses and lost the game."
puts "The random number was #{random_num}."
