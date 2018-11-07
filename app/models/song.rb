class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def artist_name
      self.artist ? self.artist.name : nil
   end

   def genre_name=(name)
      self.genre = Genre.find_or_create_by(name: name)
    end

    def genre_name
       self.genre ? self.genre.name : nil
    end

    def note_contents=(contents)
      contents.each do |content|
        note = Note.new(content: content) # new bc we don't want to save until we validate content
        if note.valid? # if it meets our validation requirements
          self.notes << note # then add it to this song's existing notes array
        else
          # "Invalid note"
        end
      end
    end

    def note_contents
      self.notes.map(&:content)
    end

end # end of Song class
