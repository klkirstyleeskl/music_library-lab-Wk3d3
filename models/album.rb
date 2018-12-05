require('pg')
require_relative('../db/sql_runner')

class Album

  attr_reader(:id)
  attr_accessor(:name, :genre, :artist_id)

def initialize(options)
  @name = options[ 'name']
  @genre = options[ 'genre']
  @id = options['id'].to_i if options['id']
  @artist_id = options['artist_id'].to_i
  # this adds the foreign key above
end

def save()
  sql = "INSERT INTO albums
    (
    name,
    genre,
    artist_id
    )
    VALUES
    (
    $1, $2, $3
    )
    RETURNING *"
    values = [@name, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
end













end
