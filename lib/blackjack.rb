def welcome
=begin
  This is a more elaborate game welcome screen! ASCII art is fun.
  puts %q{

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$     _______      _______     $$
$$    |A      |    |10  ^  |    $$
$$    |       |    | ^ ^ ^ |    $$
$$    |   ^   |    | ^ ^ ^ |    $$
$$    |       |    | ^ ^ ^ |    $$
$$    |______A|    |_____01|    $$
$$                              $$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

  Welcome to the blackjack game!
Good luck... MOHAHAHAHA *rubs hands*
  }
=end
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  sum = deal_card + deal_card
  display_card_total(sum)
  sum
end

def hit?(card_total)
  #Ask them if they want to hit or stay, save the response
  prompt_user
  player_choice = get_user_input

  #If they want to stay, ask them again! Same goes for invalid responses.
  until player_choice == "s" || player_choice == "h"
    invalid_command if player_choice != "h"
    hit?(card_total)
  end

  #If they want to hit, deal another card
  card_total += deal_card if player_choice == "h"

  card_total
end

def invalid_command
  puts "Please enter a valid command" 
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  #Welcome the user
  welcome

  #Deal them their first two cards, i.e. their initial_round
  card_total = initial_round

  #If their card total exceeds 21, the game ends.
  until card_total > 21
    card_total = hit?(card_total)
    display_card_total(card_total)
  end

  end_game(card_total)
end