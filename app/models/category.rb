class Category < ApplicationRecord
    validates :name, presence: true #for the validation of name
end
