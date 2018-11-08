class Genre < ActiveRecord::Base
  has_many :songs
  # add associations
  def song_ids=(ids)
    ids.each do |id|
      song = Song.find_by(id)
      self.songs << song
    end
  end
end
