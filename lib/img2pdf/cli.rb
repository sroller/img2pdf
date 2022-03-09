require "thor"
require "img2pdf"

module Img2pdf
  class CLI < Thor
    desc "convert DIR", "creates PDF from jpg files in DIR"
    def convert(dir)
      Img2pdf.convert(dir)
    end
  end
end
