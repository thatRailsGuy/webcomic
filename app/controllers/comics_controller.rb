class ComicsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /comics
  # GET /comics.json
  def index
    @comics = Comic.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page], :per_page => params[:page_size]||10)

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

  private
  def sort_column
    Comic.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end
end
