require 'spec_helper'
require 'f'

describe MarkList do


  describe 'file_read' do
    let(:subject) { MarkList.new }
    it "should return array of marklist " do
      expect(subject.file_read('/home/vishnu/weave_labs/Training/new/lib/marks_test.txt')).to eq(["vishnu","23","akhil","45"])
    end
  end

  describe 'operations on mark_list' do
    let(:subject) { MarkList.new(["vishnu prakash","23","akhil","45"]) }

    describe 'show_marklist' do
      it "should print list of marklist " do
        expect{subject.show_marklist(["vishnu","23","akhil","45"])}.to output("vishnu    23\nakhil    45\n").to_stdout
      end
    end

    describe 'new_student' do
      it "should print marklist include new student" do
        expect(subject.new_student(["nithin james","67"])).to eq(["vishnu prakash","23","akhil","45","nithin james","67"])
      end
    end
  end
end
