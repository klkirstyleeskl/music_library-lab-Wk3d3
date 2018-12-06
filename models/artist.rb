require('pg')
require_relative('../db/sql_runner')
require_relative('../models/album')

class Artist

attr_reader(:id)
attr_accessor(:name)


  def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    result = SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO artists
      (
      name
      )
      VALUES
      (
      $1
      )
      RETURNING *"
      values = [@name]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|order| Album.new(order)}
  end

# unsure how to test that this works// use of function 
  def self.find(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    results =  SqlRunner.run(sql, values)
    artist_hash = results.first
    artist = Artist.new(artist_hash)
    return artist
  end


  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |customer| Artist.new(artist) }
  end

  def update()
    sql = "UPDATE artists
    SET
    (
      name
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    result = SqlRunner.run(sql, values)
  end


end
