require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name 
    song.save
    song
  end
  def self.find_by_name(name)
    @@all.detect {|i| i.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    song_title = filename.split(" - ")[1].split(".mp3")[0]
    song = self.new
    song.name = song_title
    song.artist_name = artist
    song
  end
  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    song_title = filename.split(" - ")[1].split(".mp3")[0]
    song = self.create 
    song.name = song_title
    song.artist_name = artist
    song
  end
  def self.destroy_all
    @@all = []
  end
end
