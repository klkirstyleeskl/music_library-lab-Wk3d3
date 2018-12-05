require("pry")
require_relative('../models/artist')
require_relative('../models/album')

# Artist.delete_all()

artist1 = Artist.new({ 'name' => 'Michael Jackson'})
artist1.save

album1 = Album.new({
    'name' => 'Thriller',
    'genre' => 'Pop',
    'artist_id' => artist1.id
  })
album1.save

binding.pry
nil
