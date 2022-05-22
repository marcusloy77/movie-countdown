Movie/TV Countdown

link - https://ancient-brook-21026.herokuapp.com/

 
Main Features;

-Home Page with popular options
-login home page with all user selected options
-search function for different movies, allowing one to add them to your home page
-individual movie page to see before adding to home page
-Countdown to release date of movies

DATABASE Basics - 
3 tables, one describing interaction with many to many connection, one user, one movie database
Every time a movie/tv show is requested, the results required are stored in the database
hopefully a search through database first method can then be used to not make to many api requests

Controller plans:
Get pages:
	Home/index
	Search Results
	Individual Movie Page
	User Personal Page

Delete page needed to remove reference in database
create page needed to add new movies to database

Model pages all needed to match route pages

ERB Pages needed:
Home page /
Personal Home Page
Login Page

Javascript page uses Date class to calculate time until movies are coming out, reads api out and calculates based on parsing this string into Date format.

Improvments I'd like to make:
	Find an api that has more accurace release timing, and has TV show uses as well
	Improve the CSS of the page to make it much more profession looking
	Improving the Countdown to account for months and years
	Create some restrictions for login/sign up details, so that the user must use a more complicated password, and can't sign up more than once with 	 the same email
	
	
	
