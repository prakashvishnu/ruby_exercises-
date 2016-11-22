require 'spec_helper'
require 'pal'

describe Palindrome do
  let(:subject) { Palindrome.new }

  describe 'sentence check' do
    it "should return true for sentence palindromes" do
      expect(subject.sentence_palindrome('King, are you glad you are king?')).to be_truthy
    end

    it "should return false for non palindromes" do
      expect(subject.sentence_palindrome('King was ruling')).to eq(false)
      expect(subject.sentence_palindrome('King was not king')).to eq(false)
    end
  end

  describe 'string check' do
    it "should return true for palindromes" do
      expect(subject.check_string('malayalam')).to be_truthy
    end

    it "should return false for non palindromes" do
      expect(subject.check_string('King')).to eq(false)
      expect(subject.check_string('King was not king')).to eq(false)
    end
  end
end
