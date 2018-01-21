def display_towers(pile_1, pile_2, pile_3)
  puts "        _|#{pile_1[2]}|___|#{pile_2[2]}|___|#{pile_3[2]}|_____"
  puts "       / |#{pile_1[1]}|   |#{pile_2[1]}|   |#{pile_3[1]}|    /|"
  puts "      /  |#{pile_1[0]}|   |#{pile_2[0]}|   |#{pile_3[0]}|   / /"
  puts "     /____________________/ /"
  puts "     |___|1|___|2|___|3|__|/"
  puts "-------------------------"
  puts "Tower:   |1|   |2|   |3|"
  puts "========================="
end

def check_towers(pile_1, pile_2, pile_3)
  #checks if puzzle is solved
  if pile_1 == ["3", "2", "1"] or pile_2 == ["3", "2", "1"] or pile_3 == ["3", "2", "1"]
    return true 
  else
    return false 
  end 
end

def valid_disc?(disc, pile_1, pile_2, pile_3)
  #checks if disc chosen is the top disc
  current_pile = nil 
  disc_idx = nil
  towers = [pile_1, pile_2, pile_3]
  
  towers.each do |piles|
    piles.each do |position|
      if disc == position
        current_pile = piles 
      end
    end
  end

  disc_idx = current_pile.index(disc)
  if disc_idx == 2 or current_pile[disc_idx + 1] == " "
    return true
  else 
    return false 
  end
end

def valid_pile?(disc, pile)
  #checks if disc is being placed on a bigger or smaller disc
  disc_val = disc.to_i 
  pile.each do |discs|
    if discs == " "
      return true
    elsif (discs.to_i < disc_val)
      return false 
    end
  end
  return true 
end

def move_disc(disc, pile, pile_1, pile_2, pile_3)
  #perform the disc move. update the piles.
  towers = [pile_1, pile_2, pile_3]
  
  #removes disc from original pile
  towers.each do |piles|
    piles.each do |position|
      if position == disc
        disc_idx = piles.index(position)
        piles[disc_idx] = " "
        break
      end
    end
  end
  
  #puts disc into designated new pile
  if pile == "1"
    pile_1.each do |position|
      if position == " "
        disc_idx = pile_1.index(position)
        pile_1[disc_idx] = disc
        break
      end 
    end
  elsif pile == "2"
    pile_2.each do |position|
      if position == " "
        disc_idx = pile_2.index(position)
        pile_2[disc_idx] = disc
        break
      end 
    end
  else
    pile_3.each do |position|
      if position == " "
        disc_idx = pile_3.index(position)
        pile_3[disc_idx] = disc 
        break
      end
    end
  end
end

def towers_of_Hanoi
  pile_1 = ["3", "2", "1"]
  pile_2 = [" ", " ", " "]
  pile_3 = [" ", " ", " "]
  
  disc = nil 
  pile = nil 
  
  display_towers(pile_1, pile_2, pile_3)
  
  while true 
    while disc == nil or (disc != "1" or disc != "2" or disc != "3")
      puts "Which disc would you like to move?"
      disc = gets.chomp
      if disc == "1" or disc == "2" or disc == "3"
        if valid_disc?(disc, pile_1, pile_2, pile_3) == true 
          break
        else
          puts "You can only move top disc"
        end
      else
        puts "Invalid disc, please enter 1, 2, or 3"
      end
    end
    
    while pile == nil or (pile != "1" or pile != "2" or pile != "3")
      puts "Which tower would you like to move disc #{disc} to? (enter 1, 2, or 3)"
      pile = gets.chomp
      if pile == "1" or pile == "2" or pile == "3"
        if pile == "1"
          selected_pile = pile_1
        elsif pile == "2"
          selected_pile = pile_2
        else
          selected_pile = pile_3
        end
        
        if valid_pile?(disc, selected_pile) == true
          move_disc(disc, pile, pile_1, pile_2, pile_3)
          if check_towers(pile_1, pile_2, pile_3) == true 
            display_towers(pile_1, pile_2, pile_3)
            return "Congratulations, you solved the Towers of Hanoi puzzle!"
          end
          display_towers(pile_1, pile_2, pile_3)
          break
        else 
          puts "You cannot move disc #{disc} to pile #{pile}"
        end
      else 
        puts "Invalid, please enter 1, 2, or 3"
      end
    end
    
  end
end

towers_of_Hanoi
  