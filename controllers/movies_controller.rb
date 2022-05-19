# api urls

#apikey bccd0065ea3d007701a047a97effd92e

# search 

# nextEp 

# specific ep "

# front page ones? 

# for compound names its mov-mov2




get '/' do

    movies_list = get_hots()

    erb :'movie/index', locals: {
        movies_list: movies_list
    }
end

get '/search' do
    mov_name = params['mov_name']

    search_results = HTTParty.get("https://catchtheshow.herokuapp.com/api/search?name=#{mov_name}")

    erb :'movie/search', locals: {
        mov_name: mov_name,
        search_results: search_results
    }
end

get '/user_page' do
    erb :user_page
end

get '/movie_page' do
    mov_name = params['mov_name']
    #mov_name = mov_name.gsub(' ', '-')
    p mov_name
    search_results = HTTParty.get("https://catchtheshow.herokuapp.com/api/#{mov_name}")
    p search_results
    
    erb :'movie/movie_page', locals: {
        search_results: search_results
    }
end

delete '/delete_movie' do
    redirect '/'
end