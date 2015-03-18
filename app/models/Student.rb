class Student

# has_many :experiences
# has_many :experience_details,  :through => :experiences

  attr_reader :first_name, :last_name, :email, :phone_number, :short_bio, :linkedin, :twitter, :blog, :github, :photo, :id, :experiences, :experience_details

  def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @photo = hash["photo"]
    @email = hash["email"]
    @phone_number = hash["phone_number"]
    @linkedin = hash["linkedin"]
    @short_bio = hash["short_bio"]
    @github = hash["github"]
    @blog = hash["blog"]
    @id = hash["id"]
    @twitter = hash["twitter"]
    @experiences = hash["experiences"]
    @experience_details = hash["experiences"][0]["details"]


  end

  def self.find(id)
    student_hash=Unirest.get("localhost:3001/students/#{id}.json ").body
    return Student.new(student_hash)
  end
    
  def full_name
    return "#{first_name} #{last_name}"
  end

  def self.all
    students_array=Unirest.get("localhost:3001/students.json").body
    @students= []
    students_array.each do |student_hash|
     @students << Student.new(student_hash)
    end
  end

  def tweets
   tweets= []
   tweets << twitter
   tweet =tweets[0]
   return tweet.to_i
  end
end 




