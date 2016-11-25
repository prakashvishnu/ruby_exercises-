require 'pry'
class MarkList
  attr_reader :mark_list

  def file_read(marks)
    file = File.open(marks)
    #   binding.pry
    mark_list = Array.new()
      file.each_line do |line|
        mark_list<<line.split(/[\s*]+[(  )]/)
      end

      mark_list = mark_list.flatten
     return  mark_list=mark_list.map{|x| x.gsub("\n","")}
  end

  def initialize(mark_list=[])
    @mark_list = mark_list
  end

  def show_marklist(mark_list)
    show_list = mark_list.each_slice(2).to_a
    show_list.map do |a,b|
     puts "#{a}    #{b}\n"
    end
  end


  def new_student(student)
    new_array= @mark_list
    print "\n new student name and mark added \n\n"
    new_array << student
    return @new_array = new_array.flatten

  end

  def delete_student(student)
    print "\nlist of mark list after deletion\n\n"
    list=@mark_list
    mark_list = list.each_slice(2).to_a
    mark_list.map do |x|
      if x.include?student
        mark_list.delete(x)
      end
    end
    @mark_list = mark_list.flatten
    show_marklist
  end

  def sorting
    print "\n mark list in descending order\n\n"
    list= @mark_list
     order_list = list.each_slice(2).to_a
    @mark_list = order_list.sort_by(&:last).reverse.flatten
    show_marklist
  end

  def first_class_list
    puts "\n first class list\n\n"
    first_class_list = @mark_list.each_slice(2).to_a
    first_class_list.map do |a,b|
      if b.to_i>80
        puts "#{a}    #{b}\n"
      end
    end

    class_list.select{|x, y| x.to_i > 80 }
  end

  def firstname_list
    print "\n\nMark list with first names\n\n"
    list = @mark_list
    first_name = list.each_slice(2).to_a
    first_name_ary = first_name.map do |a,b|
        a = a.gsub(/\s.+/, '')
        "a b".split[0]
        puts "#{a}    #{b}\n"
      end

  end

end
# obj = MarkList.new
# obj.file_read('/home/vishnu/weave_labs/Training/new/mark_list/lib/marks.txt')
# # # obj1 = MarkList.new(["vishnu","67","akhil","69"])
# # #  obj.show_marklist(["vishnu","23","akhil","45"])
# # # obj.new_student(["vishnu","65"])
# # # obj.delete_student("Lee")
# # # obj.sorting
# # # obj.first_class_list
# # # obj.firstname_list





