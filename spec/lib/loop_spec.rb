require 'spec_helper'
require 'loop'

describe Loop  do
  let(:subject) {Loop.new}

  describe "looping" do
    it "should return an array that keeps the first letter and all input letter. All other characters are removed one by one" do
      expect(subject.looping("apple","p")).to eq(["apple","appe","app"])
    end
  end

end
