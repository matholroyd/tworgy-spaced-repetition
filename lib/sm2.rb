module SuperMemo
  
  # This class includes the algorithms as used by SuperMemo 2 (typically referred to
  # as SM2).  See the README for more information.
  class SM2
    
    # This is the main algorithm, used to calculate the new i, ef, and n factors. 
    #  Note that EF defaults to 2.5 (for items that are new)
    def self.i_and_ef_and_n(n, q, prev_i, prev_ef = 2.5)
      if q < 3    
        n = 1 
        ef = prev_ef
      else
        n += 1
        ef = new_ef(prev_ef, q)
      end
      
      case n
      when 1
        i = 1
      when 2
        i = 6
      else
        i = prev_i * ef
      end
    
      [i, ef, n]
    end
  
    # Items that were forgotten or almost forgotten (scored a grade < 4) should be recalled on the 
    # current day until the grade goes to 4 or more.
    def self.should_repeat_today(a)
      a < 4
    end
    
    private 
    
    def self.new_ef(ef_old, q)
      ef = ef_old - 0.8 + (0.28*q) - (0.02*q*q)
      ef < 1.3 ? 1.3 : ef
    end
  end
end

puts SuperMemo::SM2.i_and_ef_and_n(3, 3, 10)
