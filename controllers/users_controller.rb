get '/sign_up' do
    erb :'users/new'
end


  
post '/create_user' do
  name = params['name']
  email = params['email']
  password = params['password']

  new_user(name, email, password)
  
  redirect '/'
end
