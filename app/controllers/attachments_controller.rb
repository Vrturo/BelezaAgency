class AttachmentsController < ApplicationController

  def show
    send_data(@attachment.file_contents,
              type: @attachment.content_type,
              filename: @attachment.filename)
  end

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
