class Admin::ComicsController < ApplicationController
  before_filter :authenticate_user!
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

  # GET /comics/new
  # GET /comics/new.json
  def new
    @comic = Comic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comic }
    end
  end

  # GET /comics/1/edit
  def edit
    @comic = Comic.find(params[:id])
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(params[:comic])

    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic, notice: 'Comic was successfully created.' }
        format.json { render json: @comic, status: :created, location: @comic }
      else
        format.html { render action: "new" }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comics/1
  # PUT /comics/1.json
  def update
    @comic = Comic.find(params[:id])

    respond_to do |format|
      if @comic.update_attributes(params[:comic])
        format.html { redirect_to @comic, notice: 'Comic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy

    respond_to do |format|
      format.html { redirect_to admin_comics_path }
      format.json { head :no_content }
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
