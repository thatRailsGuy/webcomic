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
  
  def random
    offset = rand(Comic.count)
    @comic = Comic.first(:offset => offset)
    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @comic }
    end
  end
  
  def feed
    # this will be the name of the feed displayed on the feed reader
    # TODO add database driven title
    @title = "Webcomic"

    # the news items
    @comics = Comic.order("updated_at desc")

    # this will be our Feed's update timestamp
    @updated = @comics.first.updated_at unless @comics.empty?

    respond_to do |format|
      format.atom { render :layout => false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
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
