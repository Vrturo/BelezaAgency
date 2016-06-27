class AttachmentsController < ApplicationController

  def show
    send_data(@attachment.file_contents,
              type: @attachment.content_type,
              filename: @attachment.filename)
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)

    # respond_to do |format|
    #   if @attachment.save
    #     format.html { redirect_to attachments_path, notice: 'attachment was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @attachment }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @attachment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
