class TicTacToe
   def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] # from proceduarl vs. OO ruby
    end

  WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,4,8], [2,4,6], [0,3,6],
        [1,4,7], [2,5,8]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_puts)
        user_puts.to_i - 1
    end

    def move(index, player)
        @board[index] = player
        puts 
    end

    def position_taken?(index)
        @board[index] != " " 
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{|filled| filled !=" "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Please enter a number (1-9):"
        user_puts = gets.strip
        index = input_to_index(user_puts)
        if valid_move?(index)
            player = current_player
            move(index, player)
        else
            turn
        end
            display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |win_combo|
        if position_taken?(win_combo[0]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
            return win_combo
        else 
            false
        end
        end
    end

    def full?
        @board.all?{|filled| filled != " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if win_combo = won?
            @board[win_combo[0]]
        end
    end

    def play
        turn until over? 
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end
