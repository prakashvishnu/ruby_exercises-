class Loop
  def looping(str, char)
    first = str[0]
    loop_array = [str]
       i = 1
      str[1..-1].each_char do |x|
        i = i+1
        if x==char
            first = first+char
        else
            loop_array<<first + str[i..-1]
        end
      end
    return loop_array
  end
end
obj=Loop.new()
obj.looping("apple","p")
