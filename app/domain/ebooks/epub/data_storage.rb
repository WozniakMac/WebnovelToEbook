require "open-uri"

module Ebooks
  module Epub
    class DataStorage
      attr_reader :ebook

      def initialize(ebook)
        @ebook = ebook
      end

      def save(file_path)
        ebook.epub_file.attach(io: File.open(file_path), filename: "#{ebook.title.underscore}.epub")
      end
    end
  end
end
