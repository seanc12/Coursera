class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: { in: %w(male female),
    message: "%{value} is not a valid gender" }
  validate :first_or_last, :male_not_sue
  
  
  def first_or_last
     if not first_name and not last_name
             errors.add(:last_name, "can't be null")
     end
  end
  
  def male_not_sue
      if first_name == "Sue"
          errors.add(:first_name, "Can't be Sue")
      end
      
  end   
  
  def self.get_all_profiles(initial_year, final_year)
    Profile.where({birth_year: initial_year..final_year}).order(birth_year: :asc)
  end
  
end
