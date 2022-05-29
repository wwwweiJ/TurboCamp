# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    @comment = @message.comments.new(comment_params)
    @comment.save
    @comment.update(commenter:current_user.nickname, avatar: @comment.avatar)
    redirect_to project_message_path(@project , @message)
  end

  private

  def set_message 
    @project = current_user.projects.friendly.find(params[:project_id])
    @message = @project.messages.friendly.find(params[:message_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(avatar:current_user.avatar || current_user.imageurl)
  end
end
