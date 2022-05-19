def all_movies
    run_sql('SELECT * FROM movies ORDER BY id')
end
def all_movies_by_id(id)
    run_sql('SELECT * FROM movies WHERE id=$1', [id])[0]
end
def update_movie(id, title, image_url)
    run_sql("UPDATE movies SET title = $1, image_url = $2 WHERE id = $3", [title, image_url, id])
end
def delete_movie(id)
    run_sql("DELETE FROM movies WHERE id = $1", [id])
end
def create_movie(title, image_url)
    run_sql("INSERT INTO movies(name, image_url) VALUES($1, $2)", [title, image_url])
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