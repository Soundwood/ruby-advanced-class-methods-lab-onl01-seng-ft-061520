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
    if @@all.detect {|i| i.name == name} == nil 
      self.new_by_name(name)
    else
      @@all.detect {|i| i.name == name}
    end
  end
end
