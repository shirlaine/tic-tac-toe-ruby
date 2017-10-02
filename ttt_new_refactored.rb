# Tic- Tac- Toe Game

  def welcome_message
    puts 'Welcome to Tic-Tac-Toe'
  end

  def print_board(array)
   puts " #{array[0]} | #{array[1]} | #{array[2]}"
   puts line_separator = '-----------'
   puts " #{array[3]} | #{array[4]} | #{array[5]}"
   puts line_separator = '-----------'
   puts " #{array[6]} | #{array[7]} | #{array[8]}"
  end

  def get_input
    puts "Please choose a number from 0-8"
    gets.chomp
  end

  def check_input(default_board, default_input)
     default_board.include?(default_input) == false ||default_input == 'X' || default_input == 'O'
  end

  def update_board_odd(default_board, default_input)
      default_board.each do |string|
      default_board[string.to_i] = 'X' if string == default_input
      end
  end

  def update_board_even(default_board, default_input)
      default_board.each do |string|
      default_board[string.to_i] = 'O' if string == default_input
      end
  end

  def winning_combo(boardie, string)
    #array[0,1,2]
    [[string, string, string, "#{boardie[3]}", "#{boardie[4]}", "#{boardie[5]}", "#{boardie[6]}", "#{boardie[7]}", "#{boardie[8]}"],
    #array[0,3,6]
    # ["X", "1", "2", "X", "4", "5", "X", "7", "8"]
    [string, "#{boardie[1]}", "#{boardie[2]}", string, "#{boardie[4]}", "#{boardie[5]}", string, "#{boardie[7]}", "#{boardie[8]}"],
    #array[0,4,8]
    # ["X", "1", "2", "3", "X", "5", "6", "7", "X"]
    [string, "#{boardie[1]}", "#{boardie[2]}", "#{boardie[3]}", string, "#{boardie[5]}", "#{boardie[6]}", "#{boardie[7]}", string],
    #array[1,4,7]
    # ["0", "X", "2", "3", "X", "5", "6", "X", "8"]
    ["#{boardie[0]}", string, "#{boardie[2]}", "#{boardie[3]}", string, "#{boardie[5]}", "#{boardie[6]}", string, "#{boardie[8]}"],
    # #array[2,5,8]
    # # ["0", "1", "X", "3", "4", "X", "6", "7", "X"]
    ["#{boardie[0]}", "#{boardie[1]}", string, "#{boardie[3]}", "#{boardie[4]}", string, "#{boardie[6]}", "#{boardie[7]}", string],
    # #array[2,4,6]
    # # ["0", "1", "X", "3", "X", "5", "X", "7", "8"]
    ["#{boardie[0]}", "#{boardie[1]}", string, "#{boardie[3]}", string, "#{boardie[5]}", string, "#{boardie[7]}", "#{boardie[8]}"],
    # #array[2,5,8]
    # # ["0", "1", "X", "3", "4", "X", "6", "7", "X"]
    ["#{boardie[0]}", "#{boardie[1]}", string, "#{boardie[3]}", "#{boardie[4]}", string, "#{boardie[6]}", "#{boardie[7]}", string],
    # #array[6,7,8]
    # ["0", "1", "2", "3", "4", "5", "X", "X", "X"]
    ["#{boardie[0]}", "#{boardie[1]}", "#{boardie[2]}", "#{boardie[3]}", "#{boardie[4]}", "#{boardie[5]}", string, string, string],
    # ["0", "1", "2", "X", "X", "X", "6", "7", "8"]
    ["#{boardie[0]}", "#{boardie[1]}", "#{boardie[2]}", string, string, string, "#{boardie[6]}","#{boardie[7]}", "#{boardie[8]}"]]
  end

  def checks_win(default_board, another_string, turns, default_input)
    winning_array = winning_combo(default_board, another_string)
    # return value board == winning array match
    winning_array.each do |arry|
      if default_board == arry
        declare_win(default_input,turns, default_board)
      end
    end
  end

  def declare_win(default_input, turns, board)
    print_board(board)
    board= ["0", "1", "2", "3", "4", "5", "6", "7", "8"]

    if turns.odd?
      puts "Congratulations Player 2, you have won the game!"
    else turns.even?
      puts "Congratulations Player 1, you have won the game!"
    end

    puts "Play again? y/n"
    restart_or_end(default_input, board)
  end

  def checks_draw(default_input, turns, board)
    board= ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    if turns==9
      puts"It's a Draw!"
      puts "Play again? y/n"


      restart_or_end(default_input, board)
    end
  end

  def restart_or_end(default_input,board)
    board= ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    default_input=gets.chomp
    if default_input == "y"
      puts "why is is not working"
      p game(board)
      false
    elsif default_input == "n"
      puts "Thanks for playing!"
      exit
    end
  end

  #__________________Main Trunk_______________

  def game(board)
    board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    player1 = "X"
    player2 = "O"
    turns = 0
    welcome_message #program starts with this

    loop do

      if turns.odd?
        puts "This is Player 2's turn"
      else turns.even?
        puts "This is Player 1's turn"
      end

      print_board(board)
      input=get_input

      if input.casecmp('exit').zero? #first conditiont to exit loop
        break
      else
        if
          check_input(board,input)
          puts "Sorry, your answer was not a valid one! Please try again below:"
        elsif turns.odd?
          update_board_odd(board,input)
          checks_win(board,"X",turns, input)
          turns+=1
          checks_draw(input, turns, board)
        elsif turns.even?
          update_board_even(board,input)
          checks_win(board, "O",turns, input)
          turns+=1
          checks_draw(input, turns, board)
        end
    end

    end
  end

game(["0", "1", "2", "3", "4", "5", "6", "7", "8"])

