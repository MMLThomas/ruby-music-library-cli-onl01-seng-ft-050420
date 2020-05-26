require 'pry'
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import 
  end
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'." 
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    while input = gets.chomp 
      if input == 'exit'
        break
      end
    end
  end
  
  def list_songs
    song_num = 1
    songs = Song.all.sort{|a, b| a.name <=> b.name}.uniq
    songs.each do |song| 
      puts "#{song_num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      song_num += 1
    end
  end
  
  def list_artists
    artist_num = 1
    artists = Artist.all.sort{|a, b| a.name <=> b.name}.uniq
    artists.each do |a| 
      puts "#{artist_num}. #{a.name}"
      artist_num += 1
    end
  end
  
  
  def list_genres
    genre_num = 1
    genres = Genre.all.sort{|a, b| a.name <=> b.name}.uniq
    genres.each do |g| 
      puts "#{genre_num}. #{g.name}"
      genre_num += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input)
      artist = Artist.find_by_name(input)
      songs = artist.songs.sort{|a, b| a.name <=> b.name}.uniq
      song_num = 1
      songs.each do |s| 
        puts "#{song_num}. #{s.name} - #{s.genre.name}"
        song_num += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input)
      genre = Genre.find_by_name(input)
      songs = genre.songs.sort{|a, b| a.name <=> b.name}.uniq
      song_num = 1
      songs.each do |s| 
        puts "#{song_num}. #{s.artist.name} - #{s.name}"
        song_num += 1
      end
    end
    
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_count = 0
    list_songs.each{|song| song_count += 1}
    input = gets.chomp
    input = input.to_i
    if input <= list_songs.length
      song = list_songs[(list_songs.length-1)]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
      
  end
  
  
  
    
  
  
  
end