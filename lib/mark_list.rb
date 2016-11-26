require 'pry'
class MarkList
  attr_reader :mark_list

  def file_read(marks_txt)
    file = File.open(marks_txt)
    mark_list = Array.new()
      file.each_line do |line|
        mark_list<<line.split(/[\s*]+[(  )]/)
      end

    mark_list = mark_list.flatten
    return  mark_list_array = mark_list.map{|x| x.gsub("\n","")}
  end

  def initialize(mark=[])
    return @mark_list = mark
   #show_marklist(@mark_list)
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
    return new_array = new_array.flatten
    #show_marklist(new_array)

  end

  def delete_student(student)
    print "\nlist of mark list after deletion\n\n"
    list = @mark_list
    mark_list = list.each_slice(2).to_a
      mark_list.map do |x|
        if x.include?student
          mark_list.delete(x)
        end
      end
    return student_deleted = mark_list.flatten
    #show_marklist(student_deleted)
  end

  def sorting_marks
    print "\n mark list in descending order\n\n"
    list= @mark_list
    order_list = list.each_slice(2).to_a
    return sorted_list = order_list.sort_by(&:last).reverse.flatten
    #show_marklist(sorted_list)
  end

  def first_class_list
    puts "\n first class list\n\n"
    class_list = @mark_list.each_slice(2).to_a
      class_list.select! do |value|
          value[1].to_i>80
      end
    return class_list.flatten
  end

  def firstname_list
    print "\n\nMark list with first names\n\n"
    list = @mark_list
    first_name_array=Array.new
      list.each do |value|
        first_name_array<<value.split[0]
      end

    return first_name_array
  end

end



