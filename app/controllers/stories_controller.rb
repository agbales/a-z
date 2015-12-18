class StoriesController < ApplicationController
  before_action :find_story, only: [:show, :edit, :update, :destory]

  def index
  	@stories = Story.all
  end

  def new
    @stories = Story.all
  	@story = Story.new
  end

  def create
  	@story = Story.new(story_params)
  	if @story.save
  		redirect_to @story
  	else
  		render 'new'
  	end
  end

  def show 
  end
  
  def update
  	if @story.update(story_params)
  		redirect_to @story
  	else
  		render 'edit'
  	end
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private

  def story_params
  	params.require(:story).permit(:title, :author, :body)
  end

  def find_story
    @stories = Story.all
  	@story = Story.find(params[:id])
  end

end