
class Name 
    def initialize
        print "Player, your name? \n"
        name = gets.chomp
        @name = name
    end
    def player_name
        @name
    end
end
name = Name.new


class Gameboard

    def initialize(name)
        @name = name

        row_one = [" ", "|", " ", "|", " "]
        row_two = [" ", "|", " ", "|", " "]
        row_tre = [" ", "|", " ", "|", " "]

        row_one = row_one.join('')
        row_two = row_two.join('')
        row_tre = row_tre.join('')

        @row_one = row_one
        @row_two = row_two
        @row_tre = row_tre

        @arr = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]    
        @win_arr = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def win_arr
        @win_arr
    end

    def win_check?
        temp = 'P'
        temp_name = @name.player_name

        2.times do
            if @win_arr[0] == temp && @win_arr[1] == temp && @win_arr[2] == temp
                print "\n #{temp_name} wins \n \n"
                return true
                
            elsif @win_arr[3] == temp && @win_arr[4] == temp && @win_arr[5] == temp
                print "\n #{temp_name} wins \n \n"
                return true

            elsif @win_arr[6] == temp && @win_arr[7] == temp && @win_arr[8] == temp
                print "\n #{temp_name} wins \n \n"
                return true

            elsif @win_arr[0] == temp && @win_arr[3] == temp && @win_arr[6] == temp
                print "\n #{temp_name} wins \n \n"
                return true

            elsif @win_arr[1] == temp && @win_arr[4] == temp && @win_arr[7] == temp
                print "\n #{temp_name} wins \n \n"
                return true

            elsif @win_arr[2] == temp && @win_arr[5] == temp && @win_arr[8] == temp
                print "\n #{temp_name} wins \n \n"
                return true

            elsif @win_arr[0] == temp && @win_arr[4] == temp && @win_arr[8] == temp
                print "\n #{temp_name} wins \n \n"
                return true

            elsif @win_arr[2] == temp && @win_arr[4] == temp && @win_arr[6] == temp
                print "\n #{temp_name} wins \n \n"
                return true
            end
            temp = 'C'
            temp_name = 'Comp'
        end
        return false
    end

    def temp_board_show

        if @arr.include?(1) == true
            num1 = '1'
        else 
            num1 = ' '
        end

        if @arr.include?(2) == true
            num2 = '2'
        else 
            num2 = ' '
        end

        if @arr.include?(3) == true
            num3 = '3'
        else 
            num3 = ' '
        end

        if @arr.include?(4) == true
            num4 = '4'
        else 
            num4 = ' '
        end

        if @arr.include?(5) == true
            num5 = '5'
        else 
            num5 = ' '
        end

        if @arr.include?(6) == true
            num6 = '6'
        else 
            num6 = ' '
        end

        if @arr.include?(7) == true
            num7 = '7'
        else 
            num7 = ' '
        end

        if @arr.include?(8) == true
            num8 = '8'
        else 
            num8 = ' '
        end

        if @arr.include?(9) == true
            num9 = '9'
        else 
            num9 = ' '
        end

        puts ["#{num1}", " | ", "#{num2}", " | ", "#{num3}"].join('')
        puts ["#{num4}", " | ", "#{num5}", " | ", "#{num6}"].join('')
        puts ["#{num7}", " | ", "#{num8}", " | ", "#{num9}"].join('')
    end

    def board_show
        puts @row_one
        puts @row_two
        puts @row_tre
    end

    def arr
        @arr
    end

    def arr_includes(name)
        @arr.include?(name)
    end

    def row_one_at0(symbol, choice)
        @row_one[0] = symbol
        @arr.delete(1)
       @win_arr[0] = choice
    end

    def row_one_at2(symbol, choice)
        @row_one[2] = symbol
        @arr.delete(2)
        @win_arr[1] = choice
    end

    def row_one_at4(symbol, choice)
        @row_one[4] = symbol
        @arr.delete(3)
        @win_arr[2] = choice
    end

    def row_two_at0(symbol, choice)
        @row_two[0] = symbol
        @arr.delete(4)
        @win_arr[3] = choice
    end

    def row_two_at2(symbol, choice)
        @row_two[2] = symbol
        @arr.delete(5)
        @win_arr[4] = choice
    end

    def row_two_at4(symbol, choice)
        @row_two[4] = symbol
        @arr.delete(6)
        @win_arr[5] = choice
    end

    def row_tre_at0(symbol, choice)
        @row_tre[0] = symbol
        @arr.delete(7)
        @win_arr[6] = choice
    end

    def row_tre_at2(symbol, choice)
        @row_tre[2] = symbol
        @arr.delete(8)
        @win_arr[7] = choice
    end

    def row_tre_at4(symbol, choice)
        @row_tre[4] = symbol
        @arr.delete(9)
        @win_arr[8] = choice
    end
end
gameboard = Gameboard.new(name)


class Player

    def initialize(name, gameboard)
        @gameboard = gameboard
        @name = name
    end

    def player
        print "\n"
        print "Hello #{@name.player_name}"
        get_xo
    end

    def get_xo

        print "\n"
        print "Choose your weapon \n"
        print "1 selects x | 2 selects o \n"
        print "Choose "
        xo = gets.chomp

        if xo == "1"
            print "\n" 
            print "#{@name.player_name} selected x \n"
            print "Game starts \n"
            @player_symbol = "x"
            @computer_symbol = "o"
        elsif xo == "2"
            print "\n"
            print "#{@name.player_name} selected o \n"
            print "Game starts \n"
            @player_symbol = "o"
            @computer_symbol = "x"
        else 
            print "exit \n"
        end
    end

    def get_choice
 
        print "\n"
        @gameboard.temp_board_show
        print "Choose "
        get_pos = gets.chomp.to_i
        @choice = "P"

        if get_pos == 1 && @gameboard.arr_includes(1) == true
           @gameboard.row_one_at0(@player_symbol, @choice)
           print "\n"

        elsif get_pos == 2 && @gameboard.arr_includes(2) == true
            @gameboard.row_one_at2(@player_symbol, @choice)
            print "\n"

        elsif get_pos == 3 && @gameboard.arr_includes(3) == true
            @gameboard.row_one_at4(@player_symbol, @choice)
            print "\n"

        elsif get_pos == 4 && @gameboard.arr_includes(4) == true
           @gameboard.row_two_at0(@player_symbol, @choice)
           print "\n"

        elsif get_pos == 5 && @gameboard.arr_includes(5) == true
            @gameboard.row_two_at2(@player_symbol, @choice)
            print "\n"

        elsif get_pos == 6 && @gameboard.arr_includes(6) == true
            @gameboard.row_two_at4(@player_symbol, @choice)
            print "\n"
            
        elsif get_pos == 7 && @gameboard.arr_includes(7) == true
           @gameboard.row_tre_at0(@player_symbol, @choice)
           print "\n"

        elsif get_pos == 8 && @gameboard.arr_includes(8) == true
            @gameboard.row_tre_at2(@player_symbol, @choice)
            print "\n"

        elsif get_pos == 9 && @gameboard.arr_includes(9) == true
            @gameboard.row_tre_at4(@player_symbol, @choice)
            print "\n"
        end

    end

    def computer_symbol
        @computer_symbol
    end
end
new_player = Player.new(name, gameboard)
new_player.player


class Computer 

    def initialize(gameboard, player)
        @gameboard = gameboard
        @player = player
    end

    def get_choice

        comp_choice = @gameboard.arr.sample
       
        print "\n"
        print "Comp => #{comp_choice} \n"
        @choice = "C"

       if comp_choice == 1
            @gameboard.row_one_at0(@player.computer_symbol, @choice)
            print "\n"
            @gameboard.board_show

       elsif comp_choice == 2
            @gameboard.row_one_at2(@player.computer_symbol, @choice) 
            print "\n"
            @gameboard.board_show

       elsif comp_choice == 3
            @gameboard.row_one_at4(@player.computer_symbol, @choice) 
            print "\n"
            @gameboard.board_show

       elsif  comp_choice == 4
            @gameboard.row_two_at0(@player.computer_symbol, @choice) 
            print "\n"
            @gameboard.board_show

       elsif  comp_choice == 5
            @gameboard.row_two_at2(@player.computer_symbol, @choice) 
            print "\n"
            @gameboard.board_show

       elsif  comp_choice == 6
            @gameboard.row_two_at4(@player.computer_symbol, @choice) 
            print "\n"
            @gameboard.board_show

       elsif  comp_choice == 7
            @gameboard.row_tre_at0(@player.computer_symbol, @choice) 
            print "\n"
            @gameboard.board_show

       elsif  comp_choice == 8
            @gameboard.row_tre_at2(@player.computer_symbol, @choice) 
            print "\n"
            @gameboard.board_show

       elsif  comp_choice == 9
            @gameboard.row_tre_at4(@player.computer_symbol, @choice) 
            print "\n"
            @gameboard.board_show

       else 
            @gameboard.board_show
            print "\n Game end \n \n"
        end
    
    end
end
comp = Computer.new(gameboard, new_player)


class Game 

    def initialize(new_player, comp, gameboard)
        @gameboard = gameboard
        @player = new_player
        @comp = comp
    end

    def play
        5.times do
            @player.get_choice
            @comp.get_choice

           break if @gameboard.win_check? == true
        end
    end

end

play = Game.new(new_player, comp, gameboard)

play.play
