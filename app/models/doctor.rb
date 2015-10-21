class Doctor < ActiveRecord::Base

    belongs_to :user
    validates_length_of :name, :maximum => 35
    validates_length_of :zip_code, :maximum => 5
    validates :zip_code, :numericality => { only_integer: true }
    validates :years_in_practice, :numericality => { greater_than_or_equal_to: 0, less_than: 100 }
    
end
