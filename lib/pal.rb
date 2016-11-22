class Palindrome
  def sentence_palindrome(sentence)
    words = sentence.downcase.gsub(/[^a-z ]/,"").split

    words.each_with_index do |word, index|
      if word !=  words.at(-(index+1))
        return false
      end
    end
    return true
  end

  def check_string(input_string)
    chars = input_string.downcase.gsub(/[^a-z ]/,"").split('')

    chars.each_with_index do |char, index|
      if char !=  chars.at(-(index+1))
        return false
      end
    end
    return true
  end
end
