class Genre

extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_genre = Genre.new(genre)
    @@all << new_genre
    new_genre
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end

end
