class Pet < ActiveRecord::Base

    TYPES = ["Bird","Cat", "Dog" ]
    belongs_to :customer
    has_many :appointments
    
    validates :name, :breed, :age, :weight, :last_visit_date, :pet_type, presence: true
    validates_length_of :name, :maximum => 35
    
    validates_inclusion_of :pet_type, :in => TYPES
    
    
end
