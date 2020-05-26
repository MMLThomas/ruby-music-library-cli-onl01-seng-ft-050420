class Artist 
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
  
  def self.create(artist)
    artist = Artist.new(artist)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def genres 
    songs.map{|song| song.genre}.uniq
  end
  
  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.any?(song)
    
  end
  
    
  
end