require 'spec_helper'
require 'count'

describe CountLetter do
  let (:subject) {CountLetter.new}

  describe 'count' do
    it 'should return an array of alphabets and its count from the input' do
      expect(subject.freq("apple")).to eq(["a",1,"p",2,"l",1,"e",1])
    end

    it 'should not return every alphabets and its count from the input' do
      expect(subject.freq("apple")).to_not eq(["a",1,"p",2,"p",2,"l",1,"e",1])
    end
  end

end
