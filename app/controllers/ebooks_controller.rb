# frozen_string_literal: true

class EbooksController < ApplicationController
  before_action :set_ebook, only: [:show, :destroy]

  # GET /ebooks
  def index
    @ebooks = Ebook.all
  end

  # GET /ebooks/1
  def show
  end

  # GET /ebooks/new
  def new
    @ebook = Ebook.new
  end

  # POST /ebooks
  def create
    @ebook = Ebook.new(ebook_params)
    @ebook.slug = SecureRandom.uuid

    if @ebook.save
      redirect_to ebook_path(@ebook.slug), notice: "Ebook was successfully created."
    else
      render :new
    end
  end

  # DELETE /ebooks/1
  def destroy
    return unless @ebook.created?

    @ebook.destroy
    redirect_to ebooks_url, notice: "Ebook was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ebook
    @ebook = Ebook.find_by(slug: params[:slug])
  end

  # Only allow a trusted parameter "white list" through.
  def ebook_params
    params.require(:ebook).permit(:title, :urls)
  end
end
