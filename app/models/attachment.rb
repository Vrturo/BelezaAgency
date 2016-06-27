class Attachment < ActiveRecord::Base
  has_many :attachments

  def initialize(params = {})
    file = params.delete(:file)
    super
    if file
      self.filename = sanitize_filename(file.original_filename)
      self.content_type = file.content_type
      self.file_contents = file.read
    end
  end

  private
    def sanitize_filename(filename)
      # Get only the filename, not the whole path (for IE)
      return File.basename(filename)
    end

end
