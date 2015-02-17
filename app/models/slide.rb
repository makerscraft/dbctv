class Slide < ActiveRecord::Base
  attr_accessor :file
  before_create :save_image, :set_path
  # validates :description, presence: true

  private

  def named_path
    "public/images/" + self.file.original_filename
  end

  def set_path
    self.path = "/images/" + self.file.original_filename
  end

  def save_image
    # path = File.join(directory, name)
    # write the file
    File.open(named_path, "wb") { |f| f.write(self.file.read) }
  end

end
