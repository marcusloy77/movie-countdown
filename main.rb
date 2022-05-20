# rerun 'ruby main.rb'

require 'sinatra'
require 'bcrypt'
require 'httparty'
require 'dotenv'
require 'pry'
Dotenv.load

enable :sessions

#controllers
require './controllers/movies_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'

#helpers
require './helpers/sessions_helper'

#database
require './db/db'

#models
require './models/movie'
require './models/movie_to_user'
require './models/user'







