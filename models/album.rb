require('pg')
require_relative('../db/sql_runner')
require_relative('../models/artist')

class Album

  attr_reader(:id)
  attr_accessor(:title, :genre, :artist_id)

def initialize(options)
  @title = options[ 'title']
  @genre = options[ 'genre']
  @id = options['id'].to_i if options['id']
  @artist_id = options['artist_id'].to_i
  # this adds the foreign key above
end

def self.delete_all()
  sql = "DELETE FROM albums"
  result = SqlRunner.run(sql)
end


def save()
  sql = "INSERT INTO albums
    (
    title,
    genre,
    artist_id
    )
    VALUES
    (
    $1, $2, $3
    )
    RETURNING *"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run(sql)
  return albums.map { |customer| Album.new(album) }
end

def artist()
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [@artist_id]
  results = SqlRunner.run(sql, values)
  artist_hash = results[0]
  return Artist.new( artist_hash )
end


def update()
  sql = "UPDATE albums
  SET
  (
    title
  ) =
  (
    $1
  )
  WHERE id = $2"
  values = [@title, @id]
  result = SqlRunner.run(sql, values)
end













end
