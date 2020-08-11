require "open-uri"

module Ebooks
  module Epub
    class DataFetcher
      attr_reader :ebook

      def initialize(ebook)
        @ebook = ebook
      end

      def fetch_data
        ebook.urls_array.map do |url|
          Ebooks::Epub::Page.new(url: url, html: File.read(URI.open(url)))
        end
      end
    end
  end
end
