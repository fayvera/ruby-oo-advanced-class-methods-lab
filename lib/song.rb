class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all 
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

  def self.find_by_name(name)
    @@all.find do |song|
    song.name == name
    end
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)
end

  def self.alphabetical
      @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
      f = filename.chomp(".mp3").split(" - ")
      # binding.pry
      song= self.new
      song.name = f[1]
      song.artist_name = f[0]
      song
  end

  def self.create_from_filename(filename)
    f = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = f[1]
    song.artist_name = f[0]
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
 