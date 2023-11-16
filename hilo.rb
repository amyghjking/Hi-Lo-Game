#!/usr/bin/env ruby

# Game to guess random number
class HiLoGame    
    @@already_guessed = Array.new
   
    # Constructor to initialise the class with a maximum number of guesses
    def initialize(max_guesses)
	@max_guesses = max_guesses
    end

    # Welcome message for the game
    def welcome
	puts "Welcome to the Hi-Lo game.\nGuess a random whole number from 1 to 100 (inclusive)."
	puts "You will have a total of 6 guesses.\nYou cannot guess the same number more than once."
	puts ""	
    end

    def get_random_num
	random_num = rand(1..100)
    end

    # Allows user to guess number and validates input by calling validate_guess
    def guess_a_number(attempt_number, random_num)
        guesses_left = @max_guesses - attempt_number
	puts "You have #{guesses_left} guesses left."
	puts "Please guess a whole number from 1 to 100 (inclusive)."
    	
	guess = gets
	guess = validate_guess(guess)
	@@already_guessed.append(guess)

	check_guess(guess, random_num)
    end
 
    # Checks user input is a whole number between the bounds and hasn't already been guessed
    def validate_guess(guess)
	while guess.strip != guess.to_i.to_s || guess.to_i < 1 || guess.to_i > 100 || @@already_guessed.include?(guess.to_i)
	    puts "Guess a whole number from 1 to 100 (inclusive)!\nYou cannot guess the same number more than once."
	    guess = gets
	end
	guess = guess.to_i
    end

    # Checks if the guess is correct
    def check_guess(guess, random_num)
	if guess == random_num
	    puts "\nYou guessed correctly and won the game!"
	    exit 0
	elsif guess < random_num
	    puts "\nYour guess was too low!"
	elsif guess > random_num
	    puts "\nYour guess was too high!"
	end
    end

    # Informs user they have lost
    def lost_game(random_num)
	puts "\nYou made #{@max_guesses} incorrect guesses and lost the game."
	puts "The random number was #{random_num}"
    end

    # Getter
    def max_guesses
	@max_guesses
    end
end

# main starts here
game = HiLoGame.new(6)
game.welcome
random_num = game.get_random_num

# gives the user 6 guesses
for i in 0...game.max_guesses
    game.guess_a_number(i, random_num)
end

game.lost_game(random_num)
