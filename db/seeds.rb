# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include ActionView::Helpers

User.destroy_all
List.destroy_all
Scene.destroy_all

1.times do
  new_scene = Scene.create ({
    locations: "Mason & California Streets, San Francisco, CA",
    title: "180",
    writer: "Umarji Anuradha, Jayendra, Aarthi Sriram, & Suba ",
    director: "Jayendra",
    release_year: "2011",
    production_company: "SPI Cinemas",
    actor_1: "Siddarth",
    actor_2: "Nithya Menon",
    actor_3: "Priya Anand"
  })
end

1.times do
  new_user = User.create ({
    username: "bagel",
    description: "Film lover | Owner of many bad romantic comedies | Lover of San Francisco | Like to walk around.",
    email: "bagel@isangieri.com",
    password: "yoyoyo"
  })

  3.times do
    new_list = List.new
    new_list.title = FFaker::HipsterIpsum.words(rand(1)+3).join(" ")
    new_list.description = FFaker::Lorem.phrase
    new_list.save
    new_user.lists.push new_list
  end
end

20.times do
	user_params = Hash.new
  user_params[:username] = FFaker::Name.last_name
  user_params[:description] = FFaker::Lorem.phrase
	user_params[:email] = FFaker::Internet.email
	user_params[:password]  = "123456"

	new_user = User.create(user_params)

  3.times do
    new_list = List.new
    new_list.title = FFaker::HipsterIpsum.words(rand(1)+3).join(" ")
    new_list.description = FFaker::Lorem.phrase
    new_list.save
    new_user.lists.push new_list
  end

end
