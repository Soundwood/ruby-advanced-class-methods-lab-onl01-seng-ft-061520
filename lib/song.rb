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
    if self.all.include?(self)
      self.all << self
    end
    self
  end

end
