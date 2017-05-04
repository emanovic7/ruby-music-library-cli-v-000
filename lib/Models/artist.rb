class Artist


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

  def self.create(name)
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
    @songs
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

end