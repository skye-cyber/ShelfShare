class Book < ApplicationRecord
    has_many :loans, dependent: :destroy
    validates :title, presence: true
    validates :author, presence: true
end
