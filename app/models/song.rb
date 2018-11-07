class Song < ActiveRecord::Base
  # Associations
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # Clas Methods

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre ? genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |content|
      self.notes.build(content: content) if content.strip != ''
    end
  end

  def note_contents
    notes.map(&:content)
  end
end
