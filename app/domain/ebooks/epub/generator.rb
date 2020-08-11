module Ebooks
  module Epub
    class Generator
      attr_reader :data_fetcher, :formatter, :data_storage

      def initialize(data_fetcher, formatter, data_storage)
        @data_fetcher = data_fetcher
        @formatter = formatter
        @data_storage = data_storage
      end

      def generate
        pages = data_fetcher.fetch_data
        temp_file_path = formatter.format(pages)
        data_storage.save(temp_file_path)
      end
    end
  end
end
