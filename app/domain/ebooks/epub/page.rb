require "nokogiri"
require "sanitize"

module Ebooks
  module Epub
    class Page
      attr_reader :url, :html

      def initialize(url:, html:)
        @url = url
        @html = html
      end

      def title
        document.title
      end

      def content
        if content_tag.present?
          document.at_css(content_tag)
        else
          document.css("div").max_by do |element|
            element.children.count { |child| child.name == "p" }
          end
        end
      end

      def sanitized_content
        Sanitize.fragment(
          filtered_content.to_html, elements: %w[span strong p]
        )
      end

      def filtered_content
        content_to_filter = content
        content_to_filter.css("p").find_all.each do |p|
          p.remove if p.content.blank?
          p.remove if p.content.strip.empty?
        end

        content_to_filter
      end

      def header
        "<h2>#{title}</h2>\n"\
        "<p>#{url}</p>\n"
      end

      private

      def document
        @document ||= Nokogiri::HTML(html)
      end

      def content_tag
        @content_tag ||= case url
        when /novelfull.com/
          "div#chapter-content"
        when /jingletranslations.wordpress.com/
          "div#content"
        when /wuxiaworld.com/
          "div#chapter-outer"
        when /chubbycheeksthoughts.com/
          "div.entry-content"
        when /webnovelonline.com/
          "div.chapter-content"
        end
      end
    end
  end
end
