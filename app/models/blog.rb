class Blog < ApplicationRecord
	enum status: {draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged


 def self.most_recent
 	order(created_at: :desc)
 end

 	mount_uploader :image, BlogUploader

	validates_presence_of :title, :body, :status, :topic_id

  belongs_to :topic

  has_many :comments, dependent: :destroy
end 
