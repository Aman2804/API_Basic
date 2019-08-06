class CommentsController < ApplicationController

  def create
    topic = Topic.find(params[:article_id])
    comment = topic.comments.create(comment_params)
    if comment.save
      render json: {comment: comment, success:"Comment is saved" }
    else
      render json: {message: "Comment is not created"}
    end
  end

  def show
    topic = Topic.find(params[:article_id])
    comment = topic.comments.find(params[:id])
    render json: comment, serializer: CommentSerializer
    # options = [topic, id, title]
    # serialization = ActiveModelSerializers::SerializableResource.new(comment, options)
    # binding.pry
    # serialization.to_json
    # serialization.as_json
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body)
  end

end
