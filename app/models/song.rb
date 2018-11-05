require 'byebug'
class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    filter = []
     contents.each do |content|
       note = Note.find_or_create_by(content: content)
       filter << note
     end
     filter_blank = filter.reject {|note| note.content == ""}
     filter_blank.each {|note| self.notes << note}
   end

  def note_contents
    self.notes ? self.notes.map {|note| note.content} : nil
  end

end




# genre_name=
#    sets the genre to the genre of the specified name (FAILED - 4)
#  genre_name
#    returns the genre name (FAILED - 5)
#  artist_name=
#    sets the artist to the artist of the specified name (FAILED - 6)
#  artist_name
#    returns the artist name (FAILED - 7)
#  note_contents
#    returns the content of all notes as an array (FAILED - 8)
#  note_contents=
#    sets notes for a song (FAILED - 9)
#    adds to existing notes (FAILED - 10)
#    ignores blank notes (FAILED - 11)
