# FLICK HIKE

**[FLICK HIKE](http://www.filmhikes.com) is San Francisco's filmic gateway to urban life. Curate lists of memorable film scenes, plot your own filmic adventures around the city, and share them with others.**

# Contents

* **[Getting Started](#getting-started)**
get your goggles on the code
* **[Overview](#overview)**
but what IS a FLICK HIKE?
* **[Project & Planning](#project-planning)**
get with the picture
* **[Wireframes](#wireframes)**
iterative storyboarding
* **[User Stories](#user-stories)**
process, features, organization
* **[Technologies](#technologies)**
take a look at the tech
* **[Big Goals](#big-goals)**
big goals for future feature development
* **[About](#about)**
related code and applications

---


# Getting Started

###### work with this application's code

**Have a great idea you want to test in this code base? Like to take a peek under the hood?** Follow the steps below to get Flick Hike running in your local environment.

* Fork this repo and clone it onto your local machine.
* Change directory into our `flick-hike` directory.
* Run `bundle install` to install gems.
* ImageMagick must be installed on your machine (Mac OS X - `brew install imagemagick`, Ubuntu - `sudo apt-get install imagemagick -y`).
* Run `rake db:setup` to create and migrate the database (PostgreSQL must be installed on your machine).
* Run `rails s` to start the server locally.

---

# Overview

###### but what IS a FLICK HIKE?

**Flick Hike is a curation driven site for discovering San Francisco via historic film scene locations.** Users curate lists of memorable film scenes, plot their own filmic adventures around the city, and share them with others. 

**What started as an app about film mappings became a site about letting users build narratives to share as hike loops**. At first I was set on making a simple but exciting map feature using a JSON dataset of film locations in San Francisco. I quickly realized the potential of building a strong footing around user experience and curation, which led me to the current iteration of Flick Hike.

**Lists === Hikes**
Checkout the [project planning](#project-planning) section below a look at how the project is organized around list curation and user friendly route planning.

---

# Project & Planning

###### get with the picture

**The following planning steps were crucial to the design of FLICK HIKE:**

## Scope
From the beginning, the design was about hikes, maps, and points of interest. The app started as a rough idea about the way people move about San Francisco. Through a rigorous iterative design process including wireframing, data modeling, and user stories, Flick Hike was born.

## Feasibility
The project includes integrating several Google Map API features, data from third-party Open-Data JSON endpoint, and full stack development using Ruby on Rails, client side javascript, Bootstrap CSS styling with a mobile friendly layout, and full crud on multiple resources, including a nested join table using REST standards.

## User Stories
The user for Flick Hike will generally fall into two categories:

* The traveler who is new to San Francisco and looking for a unique way to experience the city, and
* The local who wants to get out and see San Francisco in a new light

What the two user groups have in common is a love of and perhaps nostalgia for film, and an interest in poking around the city on foot.

*User Stories written as developer friendly sprints*

*Sprints One and Two make MVP*

**Sprint One | a user can ...**

* Navigate to "/" and see a basic splash page with:
* See the name of the brand,
sitewide header links to brand, create a list, lists, scenes, and about.
* See links to "Log In" and "Sign Up".
* Sign up for an account
* Log into their account if they already have one
* Be redirected to a profile page after logging in
* Be redirected to a login/signup if auth required for page
* On their public profile page, see their username, avatar, short description, join date
* See the site-wide header on every page with:
* A link to "Log Out" if they're logged in / "Log In" and "Sign Up" if they navigate to pages that require authorization (lists/new, lists/:id/edit, users/:id/edit)
* Update their profile by making changes to their username, description, email
* See all the titles of lists they've created (start with pre-seeded data)
* Click on the title of one of their lists and be redirected to a "show" page for that list
* View list "show" pages with title of list, description of list, and list of scenes with film, director, release_year, street address
* See their username next to their lists

**Sprint Two | a user can ...**

* View a list of scenes on the scenes index page:
* Sorted by title A-Z
* With the scene titles linked to the individual scene "show" pages
* View a list of lists on the lists index page:
* Sorted by create_at date in descending order
* With the list titles linked to the individual list "show" pages
* On a scene’s show page, select one or more lists from a menu and click ‘add’ button to add scene to selected lists
* On a scene’s show page, click ‘add scene to new list’ and be redirected to the new list form
* Add a title and description in the new list form, below see the name of the scene to be added, and click submit to create the new list
* Click "Edit" on ANY individual list on the user show page, and be redirected to the edit form
* Click "delete" on ANY individual list on the user show page, then:
* See a pop-up that says: "Are you sure you want to delete #{list.title}?"
* If the user confirms, delete the list and stay on user show page
* If the user declines, stay on user show page
* On a user’s page:
* See list description of 140 characters max
* See the user joined, e.g. "2 days ago".
* Verify that a new list they create is successfully published on user profile by being routed to the list show page where their name is displayed as "curator"
* A user is authorized to perform certain actions on the site:
* MUST be logged in to create/update/destroy resources.
* May only edit their own profile and edit/delete their own lists.

**Sprint Three | a user can ...**

* A user CANNOT save invalid data to the database, according to the following rules:
* Signup email must be unique
* User’s description must be between 10 and 140 characters
* User’s password must not be empty
* View an error message when form validations fail, for the following validations:
* User description must be between 1 and 140 characters
* List title must not be empty
* List description must not be empty

**Sprint Four | a user can ...**

* View only the 10 most recent lists on a User page (pagination), with
* A link/button to the "Next" 10
* A link/button to the "Previous" 10
* See the number of scenes they've added to each list, next to the list’s title in their profile
* View all scenes as markers/pins on a map on the site's homepage
* Click on a pin on the homepage map and be redirected to the corresponding scene show page
* Receive a welcome email after creating an account
* Visit list pages via user friendly urls, like "/lists/list_title"


## Wireframes
Through four stages of wireframing, I finally carved the app down to a reasonable MVP. As you can see the progression, I start from a top down approach, first diving headfirst into my dream product, and selectively whittling it down to a reasonable proof of concept. This approach keeps me excited about the possibilities, while practical about what I can accomplish well in a limited amount of time, and the core functionalities the product requires.

As you can see, the wireframes go from a large interconnected grid of pages, to a streamlined MVP.

**Iteration One**
![Wireframe 01](https://github.com/isangieri/flick-hike/blob/master/app/assets/images/film-hikes-EXTENDED-wireframe.png?raw=true)

**Iteration Two**
![Wireframe 02](https://github.com/isangieri/flick-hike/blob/master/app/assets/images/film-hikes-BASIC-wireframes.png?raw=true)

**Iteration Three**
![Wireframe 03](https://github.com/isangieri/flick-hike/blob/master/app/assets/images/film-hikes-BASICest-wireframes.png?raw=true)

**Iteration Four**
![Wireframe 04](https://github.com/isangieri/flick-hike/blob/master/app/assets/images/film-hikes-BASICestest-wireframe.png?raw=true)

## Data Models
Similar to my wireframe process, I followed an iterative design for my data models, narrowing in on core functionality through examining several ways of modeling my data.

**Iteration One**
![ERD 01](https://github.com/isangieri/flick-hike/blob/master/app/assets/images/erd-final-02.jpg?raw=true)

**Iteration Two**
![ERD 02](https://github.com/isangieri/flick-hike/blob/master/app/assets/images/erd-final-01.jpg?raw=true)

**Iteration Three**
![ERD 03](https://github.com/isangieri/flick-hike/blob/master/app/assets/images/erd-final.jpg?raw=true)



## Milestones
**Three *blocks* of code I'm frustrated by and/or generally ecstatic about**

*Block One*
```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```

*Block Two*
```Ruby
var s = "JavaScript syntax highlighting";
alert(s);
```

*Block Three*
```Ruby
var s = "JavaScript syntax highlighting";
alert(s);
```

---

## Technologies

###### take a look at the tech

* **Languages**
	* Ruby on Rails
	* HTML5
	* CSS3
	* Javascript

* **Gems/External Libraries**
	* jQuery
	* bcrypt
	* Bootstrap
	* jQuery
	* jQuery UI
	* FFaker
	* Rails jQuery Autocomplete

* **Third Party APIs and Datasets**
	* Google Waypoints
	* Google HTML5 Geolocation
	* Google Maps
	* Google Directions Service
	* SF Open Data [Film Locations in San Francisco](https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am) 

* Database
	*  PostgreSQL

---

## Big Goals

###### future feature development ideas for Flick Hike

* **Incorporate calls to SF Open Data JSON endpoint**
Add functionality to currently seeded data

* **D3 Hike Memento**
Generate hike loops svg from user location along hike path as graphic element for users to store in their profiles

* **Test**
Critical components of your code to ensure that it works

* **Extended Search Functionality in Indices** 
Add 'search by' option to search indices by actor, writer, director, release year, etc.

* **Allow Users to Follow Other Users** 
Add a join table relationship between users, and display their 'follow' and 'followers' data in profile

* **User Ordered List** 
Allow users to order the scenes in their lists

* **Add Scenes to List from List Show Page** 
Allow users to select scenes from a drop down list on the list show page, and add them at the click of a button

* **Select Nearest Scene as Start Point of Hike, Or User Defined Start and End Points** 
More options for hike generation give users more power over what type of hike they get

* **Add Estimated Length And Duration of Entire Hike** 
Currently Google Directions Service give duration and length of each hike leg. The new feature will give an overview of the entire hike's length and duration

---

## About

###### check out Is Angieri's Github page and website

[Github](https://github.com/isangieri)

[www.isangieri.com](http://www.isangieri.com)