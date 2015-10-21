class User < ActiveRecord::Base
    
    has_one :doctor, dependent: :destroy
    has_one :customer,dependent: :destroy
    accepts_nested_attributes_for :customer,:doctor

VALID_EMAIL_REGX =  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, length:{maximum:105},
    uniqueness:{case_sensitive: false},
    format: {with: VALID_EMAIL_REGX}
    
has_secure_password
end
