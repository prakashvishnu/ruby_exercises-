class Loop
	def looping(str,ch)
	  #str=str.split("")
    first = str[0]
    i=0
    str.each_char do |x|
        i = i+1
        if x==ch
            first = first+ch
         else
            puts first + str[i..-1]
        end
    end
  end
end
obj=Loop.new()
obj.looping("codegolf.stackexchange.com","o")
