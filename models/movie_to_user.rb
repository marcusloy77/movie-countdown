#adds a movie to the cross database with both user and movie id
def add_movie_to_user(user_id, movie_id)
    run_sql("INSERT INTO movie_picks(user_id, movie_id) VALUES($1, $2)", [user_id, movie_id])
end


#old function, went through wrong database table
# #finds all movies a user has favourited
# def select_movies_by_user(user_id, limit)
#     run_sql('SELECT * FROM movie_picks WHERE user_id=$1 ORDER BY id DESC LIMIT $2', [user_id, limit])
# end 

#finds all users that have favourited a certain movie
def select_users_by_movie(movie_id)
    run_sql('SELECT * FROM movie_picks WHERE movie_id=$1', [movie_id])
end

#deletes a favourited movie from a users favourites
def delete_user_from_movie(user_id, movie_id)
    run_sql("DELETE FROM movie_picks WHERE user_id = $1 AND movie_id = $2", [user_id, movie_id])
end

def movie_is_favorite(user_id, movie_id)
    out=run_sql('SELECT * FROM movie_picks WHERE movie_id=$1 AND user_id = $2', [movie_id, user_id])
    if out.to_a.length > 0
        true
    else
        false
    end
end