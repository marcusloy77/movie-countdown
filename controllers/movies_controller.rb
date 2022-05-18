# api urls

# search "https://catchtheshow.herokuapp.com/api/search?name=#{mov_name}"

# nextEp "https://catchtheshow.herokuapp.com/api/#{mov_name}"

# specific ep "https://catchtheshow.herokuapp.com/api/#{mov_name}/#{season}/#{episode}"

# front page ones? https://catchtheshow.herokuapp.com/api/charts/hot

# for compound names its mov-mov2




get '/' do
    erb :'movie/index'
end

get '/search_results' do
    mov_name = params['mov_name']

    data = HTTParty.get("https://catchtheshow.herokuapp.com/api/search?name=#{mov_name}")

    erb :search_results, locals: {
        mov_name: mov_name,
        search_results: search_results
    }
end

get '/user_page' do
    erb :user_page
end

get '/movie_page' do
    erb :movie_page
end

delete '/delete_movie' do
    redirect '/'
end