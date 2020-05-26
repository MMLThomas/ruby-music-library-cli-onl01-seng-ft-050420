class Genre 
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name = name
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
  
  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end
  
  def songs
    @songs
  end
  
  def artists
    songs.map{|song| song.artist}.uniq
  end
  
end