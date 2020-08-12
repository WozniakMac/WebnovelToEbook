# frozen_string_literal: true

class EbooksController < ApplicationController
  before_action :set_ebook, only: [:show, :destroy, :generate]

  # GET /ebooks
  def index
    @ebooks = Ebook.all
  end

  # GET /ebooks/1
  def show
  end

  # GET /ebooks/new
  def new
    if @webnovel_id.present?
      webnovel = Webnovel.find(@webnovel_id)
      @ebook = Ebook.new(title: webnovel.title, urls: webnovel.chapters.map(&:url).join("\n"))
    else
      @ebook = Ebook.new
    end
  end

  # POST /ebooks
  def create
    @ebook = Ebook.new(ebook_params)
    @ebook.slug = SecureRandom.uuid

    if @ebook.valid?
      existing_ebook = Ebook.find_by(urls: @ebook.urls)

      if existing_ebook.present?
        return redirect_to ebook_path(existing_ebook.slug), notice: "Ebook already exist."
      end
    end

    if @ebook.save
      redirect_to ebook_path(@ebook.slug), notice: "Ebook data was successfully created."
    else
      render :new
    end
  end

  # DELETE /ebooks/1
  def destroy
    return unless @ebook.created?

    @ebook.destroy
    redirect_to ebooks_url, notice: "Ebook data was successfully destroyed."
  end

  # POST /ebooks/1/generate
  def generate
    return unless @ebook.created?

    GenerateEpubJob.perform_later(@ebook.id)
    @ebook.update(status: :in_progress)

    redirect_to ebook_path(@ebook.slug), notice: "Ebook will be generated soon."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ebook
    @ebook = Ebook.find_by(slug: params[:slug])
  end

  # Only allow a trusted parameter "white list" through.
  def ebook_params
    params.require(:ebook).permit(:title, :urls, :webnovel_id)
  end
end
