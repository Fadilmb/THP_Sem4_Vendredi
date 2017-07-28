class Corsaire < ApplicationRecord
	validates :first_name, presence: true , length: { maximum: 20 }
	validates :age, presence: true, :inclusion => 15..120
	validates :slack_handle, format: { with: /\S*/}
	validates :github_handle, format: { with: /\S*/}
end

