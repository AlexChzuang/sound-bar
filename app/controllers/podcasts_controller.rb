class PodcastsController < ApplicationController
  before_action :find_podcast, only: [:edit, :show, :destroy, :dashboard, :donate]

  def index
    @podcasts = Podcast.all
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)

    if @podcast.save
      redirect_to podcasts_path, notice: "新增節目成功"
    else
      render :new
    end
  end

  def show
    @episodes = @podcast.episodes
  end

  def edit
  end

  def update
    @podcast = Podcast.find(params[:id])
    cookies[:return_to_url] = request.referer

    if @podcast.update(podcast_params)
      redirect_to cookies[:return_to_url] || podcasts_path, notice: "編輯節目成功"
      cookies[:return_to_url] = nil
    else
      render :edit
    end
  end

  def destroy
    @podcast.delete
    redirect_to podcasts_path, notice: "刪除節目成功"
  end

  def dashboard
  end

  def music
  end

  def donate

  end

  private
  def podcast_params
    params.require(:podcast).permit(:avatar, :name, :artist, :email, :language, :slug, :genres, :description, :subtitle, :weblink, :copyright, :explicit, :status, :cover, :donate_title)
  end

  def find_podcast
    @podcast = Podcast.find_by(random_url: params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to podcasts_path, notice: "找不到節目"
  end
end
