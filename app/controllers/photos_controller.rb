class PhotosController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_photo, only: [:destroy]

  def create
    @new_photo = @event.photos.build(photo_params)
    @new_photo.user = current_user

    if @new_photo.save
      redirect_to @event, notice: :created
    else
      render 'events/show', alert: :error
    end
  end

  def destroy
    message = { notice: :destroyed }

    if current_user_can_edit?(photo)
      @photo.destroy
    else
      message = { alert:error}
    end

    redirect_to @event, message
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_photo
    @photo= @event.photo.find(params[:id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end

end