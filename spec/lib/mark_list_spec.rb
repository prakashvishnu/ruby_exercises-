require 'spec_helper'
require 'mark_list'

describe MarkList do


  describe 'file_read' do
    let(:subject) { MarkList.new }
    it "should return array of marklist " do
      expect(subject.file_read('/home/vishnu/weave_labs/Training/new/lib/marks_test.txt')).to eq(["vishnu","23","akhil","45"])
    end
  end

  describe 'operations on mark_list' do
    let(:subject) { MarkList.new(["vishnu prakash","81","akhil","79"]) }

    describe 'show_marklist' do
      it "should print list of marklist " do
        expect{subject.show_marklist(["vishnu","81","akhil","79"])}.to output("vishnu    81\nakhil    79\n").to_stdout
      end
    end

    describe 'new_student' do
      it "should return marklist array include new student" do
        expect(subject.new_student(["nithin james","67"])).to eq(["vishnu prakash","81","akhil","79","nithin james","67"])
      end
    end

    describe 'delete_student' do
      it "should return marklist array without deleted student" do
        expect(subject.delete_student("akhil")).to eq(["vishnu prakash","81"])
      end
    end

    describe 'sorting_marks' do
      it 'should return marklist array in descending order of marks' do
        expect(subject.sorting_marks).to eq(["vishnu prakash","81","akhil","79"])
      end
    end

    describe 'firstclass list' do
      it 'should return marklist array in descending order of marks' do
        expect(subject.first_class_list).to eq(["vishnu prakash","81"])
      end
    end

    describe 'firstname list' do
      it 'should return marklist array with first name only' do
        expect(subject.firstname_list).to eq(["vishnu","81","akhil","79"])
      end
    end
  end
end
