class FeedsController < ApplicationController
  before_filter :enforce_login

  # GET /feeds
  # GET /feeds.json
  def index
    @user_feeds = UserFeed.find_all_by_user_id(current_user.id)
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    redirect_to feeds_url
    # @feed = Feed.find(params[:id])
    # @user_feed = current_user.user_feeds.find_by_feed_id(@feed.id)
  end

  # GET /feeds/new
  def new
    @feed = current_user.feeds.new
  end

  # POST /feeds
  # POST /feeds.json
  def create
    url = params[:feed][:url]
    @feed = Feed.find_by_url(url) || Feed.new(url: url)
    @feed.fetch

    respond_to do |format|
      if @feed.save
        current_user.feeds << @feed unless current_user.feeds.include? @feed
        format.html { redirect_to @feed, notice: 'Feed was successfully added.' }
        format.json { render action: 'show', status: :created, location: @feed }
      else
        format.html { render action: 'new' }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    current_user.user_feeds.find_by_feed_id(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.json { head :no_content }
    end
  end
end
