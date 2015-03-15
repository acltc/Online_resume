class Student

  attr_reader :first_name, :last_name, :email, :phone_number, :short_bio, :linkendin, :tweeter, :personal_blog_website, :github, :photo

  def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
  end

  def self.find(id)
    student_hash=Unirest.get("localhost:3001/students/#{id}.json ").body
    return Student.new(student_hash)
  end
    
  def full_name
    return "#{first_name} #{last_name}"
  end
end 