class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    
    #default scope
    default_scope {order :created_at}

    #named scope
    scope :published, -> {where(published: true)}
    scope :unpublished, -> {where(published: false)}
    scope :order_by_latest, -> {reorder(created_at: :desc)}
    has_rich_text :body

end
