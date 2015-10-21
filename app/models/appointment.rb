class Appointment < ActiveRecord::Base
    belongs_to :pet
    belongs_to :doctor
    
    validates :pet_id, :doctor_id, :customer_id,:reason_for_visit, presence: true
    validate :visit_date_cannot_be_in_the_past

    def visit_date_cannot_be_in_the_past
      errors.add(:date_of_visit, "must can't be in the past") if !date_of_visit.blank? && date_of_visit < Time.now
    end
end
