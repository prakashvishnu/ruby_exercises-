class CountLetter

  def freq(str)
    str_array = str.split("")
    str_new = str_array.uniq
    freq = Array.new()
      str_new.each do |x|
        freq<<x<<str_array.count(x)
      end
    return freq
  end

end

