class Slide < ActiveRecord::Base
  attr_accessor :file
  before_save :save_image, :set_path




  private

  def named_path
    "public/images/" + self.file.original_filename
  end

  def set_path
    puts "images" + self.file.original_filename
    self.path = "/images/" + self.file.original_filename
  end

  def save_image
    # path = File.join(directory, name)
    # write the file
    File.open(named_path, "wb") { |f| f.write(self.file.read) }
  end

end
