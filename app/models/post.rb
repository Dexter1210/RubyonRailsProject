class Post < ApplicationRecord
    belongs_to :category
    has_many :taggings
    has_many :tags, through: :taggings

    #default scope
    default_scope {order :created_at}

    #named scope
    scope :published, -> {where(published: true)}
    scope :unpublished, -> {where(published: false)}
    scope :order_by_latest, -> {reorder(created_at: :desc)}
end
