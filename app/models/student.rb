# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)
    search_results = []
    if name == ""
      return self.all
    else
      self.all.each do |student|
        if student.name.downcase.include?(name.downcase)
          search_results << student
        end
      end
      return search_results
    end
  end
end
