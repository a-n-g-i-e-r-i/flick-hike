# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# new_scene = Scene.create ({
#   locations: "Mason & California Streets, San Francisco, CA",
#   title: "180",
#   writer: "Umarji Anuradha, Jayendra, Aarthi Sriram, & Suba ",
#   director: "Jayendra",
#   release_year: "2011",
#   production_company: "SPI Cinemas",
#   actor_1: "Siddarth",
#   actor_2: "Nithya Menon",
#   actor_3: "Priya Anand"
# })

include ActionView::Helpers

User.destroy_all
List.destroy_all
Scene.destroy_all
ListScene.destroy_all

json = ActiveSupport::JSON.decode(File.read('db/seeds/trial.json'))

json.each do |a|
  new_scene = Scene.new
  @locations = a['locations']
  if @locations == nil
    @locations = 'San Francisco, CA'
  else
    @locations = @locations + ', San Francisco, CA'
  end
  new_scene.locations = @locations
  new_scene.title = a['title']
  new_scene.writer = a['writer']
  new_scene.director = a['director']
  new_scene.release_year = a['release_year']
  new_scene.production_company = a['production_company']
  new_scene.actor_1 = a['actor_1']
  new_scene.save
end

1.times do
  new_user = User.create ({
    username: "bagel",
    description: "Film lover | Owner of many bad romantic comedies | Lover of San Francisco | Like to walk around.",
    email: "bagel@isangieri.com",
    password: "yoyoyo"
  })

  3.times do
    # new list
    new_list = List.new
    new_list.title = FFaker::HipsterIpsum.words(rand(1)+3).join(" ")
    new_list.description = FFaker::Lorem.phrase
    new_list.save
    new_user.lists.push new_list

    3.times do
      # new scene
      new_scene = Scene.new
      new_scene.locations = "Mason & California Streets, San Francisco, CA"
      new_scene.title = FFaker::HipsterIpsum.words(rand(1)+1).join(" ")
      new_scene.writer = FFaker::Name.last_name
      new_scene.director = FFaker::Name.last_name
      new_scene.release_year = "2011"
      new_scene.production_company = "SPI Cinemas"
      new_scene.actor_1 = "Brad Pitts"
      new_scene.save
      new_scene.lists.push(new_list)
    end
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

    3.times do
      # new scene
      new_scene = Scene.new
      new_scene.locations = "Mason & California Streets, San Francisco, CA"
      new_scene.title = FFaker::HipsterIpsum.words(rand(1)+1).join(" ")
      new_scene.writer = FFaker::Name.last_name
      new_scene.director = FFaker::Name.last_name
      new_scene.release_year = "2011"
      new_scene.production_company = "SPI Cinemas"
      new_scene.actor_1 = "Brad Pitts"
      new_scene.save
      new_scene.lists.push(new_list)
    end
  end
end
