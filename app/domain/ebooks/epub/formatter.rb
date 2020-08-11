require "gepub"

module Ebooks
  module Epub
    class Formatter
      attr_reader :ebook

      def initialize(ebook)
        @ebook = ebook
      end

      def format(pages)
        ebook_generator = GEPUB::Book.new { |book|
          book.identifier = "http://www.webnoveltoebook.com/#{ebook.slug}"
          book.title = ebook.title
          book.creator = "www.webnoveltoebook.com"
          book.contributor = "www.webnoveltoebook.com"
          book.language = "en"

          book.ordered do
            book.add_item("cover.xhtml")
              .add_content(StringIO.new(template(ebook.title, "<h1>#{ebook.title}</h1>")))
            pages.each_with_index do |page, index|
              book.add_item("chapter-#{index + 1}.xhtml")
                .add_content(StringIO.new(template(page.title, "#{page.header}\n#{page.sanitized_content}")))
            end
          end
        }

        path = "/tmp/#{ebook.slug}-#{DateTime.now.strftime("%s")}.epub"
        ebook_generator.generate_epub(path)
        path
      end

      def template(title, body)
        "<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><title>#{title}</title></head><body>#{body}</body></html>"
      end
    end
  end
end
