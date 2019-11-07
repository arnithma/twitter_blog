class Tweet < ApplicationRecord
	belongs_to :user
	has_many :tweets_tags
	has_many :tags, through: :tweets_tags
 	validates :message, presence: true
 	validates :message, length: {maximum: 220, too_long:  "A tweet is only 220 max."}

end
