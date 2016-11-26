require 'spec_helper'
require 'count_triple'

describe CountTriple do
  let(:subject) { CountTriple.new }

  describe "count_triple" do

    it "should return 0 for asasd" do
      expect(subject.count_triple('assd')).to eq(0)
    end

    it "should return 1 for xxxcfzc" do
      expect(subject.count_triple('xxxxcfzc')).to eq(2)
    end
     it "should not return 0 for xxxcfzc" do
      expect(subject.count_triple('xxxcfzc')).to_not eq(0)
    end
  end

end
