require 'pry'
class Song 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end
  
  def name
    @name
  end
  
  def artist
    @artist
  end
  
  def genre
    @genre
  end
  
  def name=(name)
    @name = name
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.songs << self if !genre.songs.any?(self)
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(song)
    song = Song.new(song)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end
  end
  
  def self.new_from_filename(file_name)
    file_name.slice!('.mp3')
    file_name = file_name.split(" - ")
    song = self.find_or_create_by_name(file_name[1])
    artist = Artist.find_or_create_by_name(file_name[0])
    genre = Genre.find_or_create_by_name(file_name[2])
    song.artist=(artist)
    song.genre=(genre)
    song
  end
  
  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    song.save
  end
    
 
  

  
  
  
end