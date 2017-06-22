class Student
attr_accessor :first_name, :last_name, :courses
attr_reader :name


  def initialize(first_name, last_name, courses = [])
    @first_name = first_name
    @last_name = last_name
    @courses = courses
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def courses
    @courses
  end

  def enroll(new_course)
    if has_conflict?(new_course)
      raise "course conflicts with already enrolled course"
    elsif !@courses.include?(new_course)
      @courses << new_course
      new_course.students << self
    end
  end

  def course_load
    new_hash = Hash.new(0)
    @courses.each do |course|
      new_hash[course.department] += course.credits
    end
    new_hash
  end

  def has_conflict?(new_course)
    @courses.each do |course|
      if course.conflicts_with?(new_course)
        return true
      end
    end
    false
  end
    # * Update `Student#enroll` so that you raise an error if a `Student`
    #   enrolls in a new course that conflicts with an existing course time.
    #     * May want to write a `Student#has_conflict?` method to help.

end
