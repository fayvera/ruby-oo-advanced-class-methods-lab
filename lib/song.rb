class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all << name
  end

  def save
    self.class.all << self
  end
  # given

  def self.create
    s = self.new
    s.save
    s
  end 

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name 
    s.save
    s
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
    song.name == song_name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name
      self.find_by_name(name)
    else     
      self.create_by_name(name)
  end
end


end
 