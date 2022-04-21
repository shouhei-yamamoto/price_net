class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]

  
  def index
    @photos = Photo.all
    @photos = Photo.all.order(created_at: "DESC")
    @photos = @photos.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
    @photos = @photos.page(params[:page]).per(16)
  end


  def show
    @comments = @photo.comments
    @comment = @photo.comments.build
    @favorite = current_user.favorites.find_by(photo_id: @photo.id)
  end


  def new
    if params[:back]
      @photo = Photo.new(photo_params)
      @product = @photo.products.build
      @product_url = @photo.product_urls.build
    else
      @photo = Photo.new
      @product = @photo.products.build
      @product_url = @photo.product_urls.build
    end
  end

  def confirm
    @photo = Photo.new(photo_params)
    @product = @photo.products.build
    @product_url = @photo.product_urls.build
  end


  def edit
  end


  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    respond_to do |format|
      # binding.irb
      if @photo.save
        format.html { redirect_to photo_url(@photo), notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to photo_url(@photo), notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url, notice: "投稿写真を削除しました！" }
      format.json { head :no_content }
    end
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:image, :image_cache, :content, :address,  { label_ids: [] },
                                    products_attributes: [:id, :price, :_destroy],
                                    product_urls_attributes: [:id, :price_url, :_destroy])
    end
end
