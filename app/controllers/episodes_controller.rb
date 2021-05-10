class EpisodesController < ApplicationController
  before_action :find_episode, only: [:edit, :update, :show, :destroy]
  before_action :find_podcast, except: [:index]

  def new
    @episode = Episode.new
  end

  def create
    @episode = @podcast.episodes.new(episode_params)

    if @episode.save
      redirect_to podcast_path(@podcast), notice: "新增單集成功"
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @episode.update(episode_params)
      redirect_to podcast_path(@podcast), notice: "編輯單集成功"
    else
      render :edit
    end
  end

  def destroy
    @episode.delete
    redirect_to podcast_path(@podcast), notice: "刪除單集成功"
  end

  private
  def episode_params
    params.require(:episode).permit(:audio, :title, :description, :keyword, :season, :episode, :explicit, :status)
  end

  def find_episode
    @episode = Episode.find(params[:id])
  end

  def find_podcast
    @podcast = Podcast.find(params[:podcast_id])
  end
  
end