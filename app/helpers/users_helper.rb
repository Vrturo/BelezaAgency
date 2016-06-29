module UsersHelper
  def add_attachment_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :attachments, :partial => 'attachment', :object => Attachment.new
      end
    end
end
