class CountTriple

  def count_triple(str)
    str = str.split("")
    triples = 0
    str.each_with_index do |char,index|
      if char == str[index+1] && str[index+1] == str[index+2]
        triples+=1
      end
    end
    return triples
  end

end
ob = CountTriple.new
ob.count_triple("")
# CountTriple.count_triple("xxxxabyyyyycd")
