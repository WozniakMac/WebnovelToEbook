# frozen_string_literal: true

# == Schema Information
#
# Table name: ebooks
#
#  id         :bigint           not null, primary key
#  progress   :integer
#  slug       :string
#  status     :integer          default("created"), not null
#  title      :string
#  urls       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Ebook < ApplicationRecord
  URLS_LIMIT = 20

  enum status: %i[created in_progress done]

  before_validation :clean_urls

  validates :title, presence: true
  validates :urls, presence: true
  validates :slug, presence: true
  validate :urls_limit
  validate :urls_format

  has_one_attached :epub_file

  def urls_array
    urls.split("\n")
  end

  private

  def clean_urls
    self.urls = urls.split("\n")
      .map { |url| url.delete("\r") }
      .reject { |url| url.blank? }
      .join("\n")
  end

  def urls_limit
    if urls.split("\n").length > URLS_LIMIT
      errors.add :urls, "has too many records. You can only have #{URLS_LIMIT} urls"
    end
  end

  def urls_format
    urls.split("\n").each do |url|
      unless url_valid?(url)
        errors.add :urls, "#{url} has invalid format"
      end
    end
  end

  def url_valid?(url)
    url = begin
            URI.parse(url)
          rescue
            false
          end
    url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
  end
end
