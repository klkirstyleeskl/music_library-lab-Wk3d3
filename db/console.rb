require("pry")
require_relative('../models/artist')
require_relative('../models/album')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({ 'name' => 'FleetWood Mac'})
artist1.save

album1 = Album.new({
    'title' => 'Tusk',
    'genre' => 'Rock',
    'artist_id' => artist1.id
  })
album1.save

album2 = Album.new({
    'title' => 'Tango in the night',
    'genre' => 'Rock',
    'artist_id' => artist1.id
  })
album2.save

album3 = Album.new({
    'title' => 'Rumours',
    'genre' => 'Rock',
    'artist_id' => artist1.id
  })
album3.save

binding.pry
nil
