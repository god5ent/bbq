class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if @comment.save
      redirect_to @event, notice: 'Comment horosh aga'
    else
      render 'events/show', alert: 'NEHOROSH'
    end
  end

  def destroy
    @comment.destroy

    message = {notice: 'udaleno'}

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = {alert: 'errror'}
    end
    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end
end
