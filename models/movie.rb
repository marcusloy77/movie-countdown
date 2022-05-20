def all_movies(limit)
    run_sql('SELECT * FROM movies ORDER BY id DESC LIMIT $1', [limit])
end
def all_movies_by_id(id)
    run_sql('SELECT * FROM movies WHERE id=$1', [id])[0]
end
#finds all movies a user has favourited
def select_movies_by_user(user_id, limit)
    run_sql('SELECT * FROM movies WHERE id=$1 ORDER BY id DESC LIMIT $2', [user_id, limit])
end 
def all_movies_by_movie_id(movie_id)
    out=run_sql('SELECT * FROM movies WHERE movie_id=$1', [movie_id])
    if out.to_a.length > 0
        return out[0]
    else
        nil
    end
end
def update_movie(id, title, release_date, cover_art, movie_id, runtime, overview, stat)
    run_sql("UPDATE movies SET title = $2, release_date = $3, cover_art = $4, movie_id = $5, runtime = $6, overview = $7, stat = $8 WHERE id = $1", [id, title, release_date, cover_art, movie_id, runtime, overview, stat])
end
def delete_movie(id)
    run_sql("DELETE FROM movies WHERE id = $1", [id])
end
def create_movie(title, release_date, cover_art, movie_id, runtime, overview, stat)
    run_sql("INSERT INTO movies(title, release_date, cover_art, movie_id, runtime, overview, stat) VALUES($1, $2, $3, $4, $5, $6, $7)", [title, release_date, cover_art, movie_id, runtime, overview, stat])
end

def favs_to_movies(fav_list)
    movie_list = []
    p "fav to movies function here"
    fav_list.each do |fav|
        movie_id = fav['movie_id']
        movie = all_movies_by_movie_id(movie_id)
        movie_list.push(movie)
    end
    p movie_list
    movie_list
end

#for home page api requests we want to:
#

# api dev plan - #
#1. search bar
#2. results page
#3. movie page
#4. personal page
#5. hot page
#6. 