class GenerateEpubJob < ApplicationJob
  queue_as :default

  def perform(ebook_id)
    ebook = Ebook.find(ebook_id)
    data_fetcher = Ebooks::Epub::DataFetcher.new(ebook)
    formatter = Ebooks::Epub::Formatter.new(ebook)
    data_storage = Ebooks::Epub::DataStorage.new(ebook)
    generator = Ebooks::Epub::Generator.new(data_fetcher, formatter, data_storage)
    generator.generate
    ebook.update(status: :done)
  end
end
