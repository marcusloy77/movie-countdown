# api urls

api_key = "bccd0065ea3d007701a047a97effd92e"

#https://api.themoviedb.org/3/movie/550?api_key=bccd0065ea3d007701a047a97effd92e

# search #https://api.themoviedb.org/3/search/movie?api_key=bccd0065ea3d007701a047a97effd92e&language=en-US&query=#{mov_name}&page=1&include_adult=false

# images https://image.tmdb.org/t/p/w500/#{imageurl} 

# specific ep "

# front page ones? 

# for compound names its mov-mov2

# https://static.next-episode.net/tv-shows-images/huge/stranger-things.jpg




get '/' do

    #movies_list = get_hots()

    erb :'movie/index', locals: {
        #movies_list: movies_list
    }
end


get '/search' do

    #this is to keep track of how many pages we are searching through
    page_num = params['page_num']
    if page_num
        current_page = page_num.to_i
    else
        current_page = 1
    end

    mov_name = params['mov_name']

    data= HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{mov_name}&page=#{current_page}&include_adult=false")
    search_results = data['results']


    number_pages = data['total_pages']

    if current_page == number_pages.to_i
        final_page = true
    else
        final_page = false
    end


    erb :'movie/search', locals: {
        mov_name: mov_name,
        search_results: search_results,
        final_page: final_page,
        current_page: current_page
    }
end

get '/user_page' do
    erb :user_page
end

get '/movie_page' do
    
    mov_id = params['mov_id']
    #mov_name = mov_name.gsub(' ', '-')
 
    data = HTTParty.get("https://api.themoviedb.org/3/movie/#{mov_id}?api_key=#{api_key}&language=en-US")
    #https://api.themoviedb.org/3/movie/973742?api_key=bccd0065ea3d007701a047a97effd92e&language=en-US
    p data
    
    erb :'movie/movie_page', locals: {
        data: data
    }
end

delete '/delete_movie' do
    redirect '/'
end