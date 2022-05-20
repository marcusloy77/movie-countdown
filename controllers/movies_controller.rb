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
    movie_id = 273

    #finds list of recent favorite movies, for user or in general if not logged in
    if logged_in?
        user_id = session['user_id']
        fav_list = select_movies_by_user(user_id, 9)
    else
        fav_list = all_movies(9)
    end

    #uses list of favorite movie ids to find full


    erb :'movie/index', locals: {
        movies_list: movies_list
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
    
    
    erb :'movie/movie_page', locals: {
        data: data
    }
end




delete '/delete_movie' do
    redirect '/'
end

post '/add_movie' do
    title = params['title']
    release_date = params['release_date']
    cover_art = params['cover_art']
    movie_id = params['movie_id']
    runtime = params['runtime']
    overview = params['overview']
    stat = params['stat']


    if all_movies_by_movie_id(movie_id).nil?
        p 'creating movie id in database --------------'
        create_movie(title, release_date, cover_art, movie_id, runtime, overview, stat)
    else 
        p "movie already in database ----------------------"
    end
    #if movie is not already in favourites, add to favourites table
    user_id = session['user_id']
    if !movie_is_favorite(user_id, movie_id)
        add_movie_to_user(user_id, movie_id)
        p "fav added ---------"
    end


    #first check if movie is already in database, then
    #when fav button clicked, record all params into post, call create movie and add movie/user id to database
    

    redirect '/'
end