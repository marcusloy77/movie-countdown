require 'pg'

def run_sql(sql, params=[])
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'movies_db'})
  data = db.exec_params(sql, params)
  db.close
  data
end

#bccd0065ea3d007701a047a97effd92e api key
#eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiY2NkMDA2NWVhM2QwMDc3MDFhMDQ3YTk3ZWZmZDkyZSIsInN1YiI6IjYyODVhYTJjMDViNTQ5MDA2NjRhMDFhOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nDUzCrQBKqfWdGVJykgFY6sFJVTlVKu1nE5fgauIwEk read access token