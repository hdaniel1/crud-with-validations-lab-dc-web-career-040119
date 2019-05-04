class Song < ApplicationRecord
	validates :title, presence: true, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
	validates :released, inclusion: {in: [true, false]}
	validates :release_year, presence: true, if: :released?
	validates :artist_name, presence: true
	validate :valid_year


	def valid_year
		if self.release_year && self.release_year > Date.today.year 
			errors.add(:release_year, "Can't be in the future")
		end 
	end 

	def released? 
		self.released == true
	end 


end
