class Category < ApplicationRecord
    validates :name, presence: true #for the validation of name
    has_many :posts, dependent: :nullify   #:destroy
end
