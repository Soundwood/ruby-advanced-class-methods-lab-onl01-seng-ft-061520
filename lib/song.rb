class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(song)
    if self.all.include?(song)
      self.all << self
    end
    self
  end

end
