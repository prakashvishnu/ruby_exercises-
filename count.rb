class CountLetter

  def self.freq(str)
    str_array = str.split("")
    str_new = str_array.uniq
    str_new.each do |x|
      puts "#{x}   #{str_array.count(x)}"
    end
  end

end
CountLetter.freq("appu")

