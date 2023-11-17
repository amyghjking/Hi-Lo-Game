#!/usr/bin/env ruby

# Game to guess random number
class HiLoGame

  # Constructor to initialise the class with a maximum number of guesses
  def initialize(max_guesses)
    @max_guesses = max_guesses
    @already_guessed = Array.new
    @random_num = get_random_num
  end

  # The game is started
  def play
    welcome

    while game_running?
      print_guesses_left
      guess = guess_a_number
      check_guess(guess)
	
      if has_won?(guess)
        print_has_won
	return
      end
    end

    print_lost_game
  end    

  private

  def get_random_num
    random_num = rand(1..100)
  end

  # Welcome message for the game
  def welcome
    puts "Welcome to the Hi-Lo game.\nGuess a random whole number from 1 to 100 (inclusive)."
    puts "You will have a total of #{@max_guesses} guesses.\nYou cannot guess the same number more than once."
    puts ""
  end

  # Returns true if there are turns left
  def game_running?
    guesses_left > 0
  end

  # Returns true if guess equals the random number
  def has_won?(guess)
    guess == @random_num
  end

  def print_guesses_left
    puts "You have #{guesses_left} guesses left.\nPlease guess a whole number from 1 to 100 (inclusive)."
  end

  def guesses_left
    @max_guesses - @already_guessed.length
  end

  # Allows user to guess number and validates input by calling validate_guess
  def guess_a_number	
    guess = gets
    guess = validate_guess(guess)
    @already_guessed << guess
    guess
  end
 
  # Checks user input is a whole number between the bounds and hasn't already been guessed
  def validate_guess(guess)
    while !is_number?(guess) || !is_in_range?(guess) || already_guessed?(guess)
      puts "Guess a whole number from 1 to 100 (inclusive)!\nYou cannot guess the same number more than once."
      guess = gets
    end
    
    guess.to_i
  end

  # Returns true if guess is a number
  def is_number?(guess)
    guess.strip == guess.to_i.to_s
  end

  # Returns true if guess is in range
  def is_in_range?(guess)
    guess.to_i > 0 && guess.to_i < 101
  end

  # Returns true if number already been guessed
  def already_guessed?(guess)
    @already_guessed.include?(guess.to_i)
  end

  # Checks if the guess is correct
  def check_guess(guess)
    if guess < @random_num
      puts "\nYour guess was too low!"
    elsif guess > @random_num
      puts "\nYour guess was too high!"
    end
  end

  # Informs user they have won
  def print_has_won
    puts "\nYou guessed correctly and won the game!"
  end

  # Informs user they have lost
  def print_lost_game
    puts "\nYou made #{@max_guesses} incorrect guesses and lost the game."
    puts "The random number was #{@random_num}"
  end
end

# Main starts here
game = HiLoGame.new(6).play
