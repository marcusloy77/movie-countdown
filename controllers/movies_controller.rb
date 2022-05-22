# api urls


api_key = ENV['API_KEY']
#api_key = ENV['TMDB_API_KEY']


get '/' do

    movie_id = 273

    #finds list of recent favorite movies, for user or in general if not logged in
    if logged_in?
        user_id = session['user_id']
        fav_list = select_movies_by_user(user_id, 8)
    else
        fav_list = all_movies(8)
    end

    movies_list = favs_to_movies(fav_list)

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
    no_results = false
    data= HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{mov_name}&page=#{current_page}&include_adult=false")
    search_results = data['results']
    if data['results'].empty?
        no_results = true
    end
   

    number_pages = data['total_pages']

    if current_page == number_pages.to_i
        final_page = true
    else
        final_page = false
    end


    erb :'movie/search', locals: {
        no_results: no_results,
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
        create_movie(title, release_date, cover_art, movie_id, runtime, overview, stat)
    else 
    end
    #if movie is not already in favourites, add to favourites table
    user_id = session['user_id']
    if !movie_is_favorite(user_id, movie_id)
        add_movie_to_user(user_id, movie_id)
    end
    redirect '/'
end