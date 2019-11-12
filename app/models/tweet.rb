class Tweet < ApplicationRecord
	belongs_to :user
	has_many :tweets_tags
	has_many :tags, through: :tweets_tags
 	validates :message, presence: true
 	validates :message, length: true, length: {maximum: 220, too_long:  "A tweet is only 220 max."}, on: :create
 	before_validation :link_check, on: :create
 	after_validation :apply_link, on: :create
 	private
	def apply_link
		arr = self.message.split
		 index = arr.map {|x| x.include?("http://") || x.include?("https://") }.index(true)

		 if index >= 0
		 	url = arr[index]
		 	arr[index] = "<a href= '#{self.link}' target='_blank'>#{url}</a>"
		 end

		self.message = arr.join(" ")
	end
	  def link_check
	  	check = false
	  	if  self.message.include? "http://"
	  		check = true
	  	elsif self.message.include? "https://"
	  		check = true
	  	end

	  	if check == true
	  		arr = self.message.split
	  		index = arr.map{ |x| x.include? "http"}.index(true)|| arr.map{ |x| x.include? "https"}.index(true)

	  		  self.link = arr[index]
	  		  if arr[index].length > 23
	  		     arr[index] = "#{arr[index][0..20]}..."
	  		  end

	  		  self.message = arr.join(" ")
	  	end
	  end
end