class Task < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :user
    has_many :comments, dependent: :destroy
end
