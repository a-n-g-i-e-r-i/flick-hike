# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include ActionView::Helpers

User.destroy_all

User.create ({
  username: "bagel",
  description: "Film lover | Owner of many bad romantic comedies | Lover of San Francisco | Like to walk around.",
  email: "bagel@isangieri.com",
  password_digest: "yoyoyo"
})

20.times do
	user_params = Hash.new
  user_params[:username] = FFaker::Name.last_name
  user_params[:description] = FFaker::Lorem.phrase
	user_params[:email] = FFaker::Internet.email
	user_params[:password_digest]  = "123456"

	new_user = User.create(user_params)

end
