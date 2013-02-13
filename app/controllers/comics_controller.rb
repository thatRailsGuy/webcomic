class ComicsController < ApplicationController
  # GET /comics
  # GET /comics.json
  def index
    @comics = Comic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comics }
    end
  end

  # GET /comics/1
  # GET /comics/1.json
  def show
    @comic = Comic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comic }
    end
  end
  # GET /comics/first
  # GET /comics/first.json
  def first
    @comic = Comic.first
    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @comic }
    end
  end

  # GET /comics/latest
  # GET /comics/latest.json
  def latest
    @comic = Comic.last
    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @comic }
    end
  end
end
