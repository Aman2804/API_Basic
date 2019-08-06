class ArticlesController < ApplicationController

  def create
    topic = Topic.create(topic_params)
    if topic.save
      render json: {topic: topic, status: :success}
    else
      render json: {message: "topic is not create"}
    end
  end

  def show
    topic = Topic.find(params[:id])
    render json: topic, serializer: ArticleSerializer
  end

  def destroy
    topic = Topic.find(params[:id])
    if topic = topic.destroy
      render json: { topic: topic}
    else
      render json: {message: "can't proceed your request"}
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)    
  end

end
