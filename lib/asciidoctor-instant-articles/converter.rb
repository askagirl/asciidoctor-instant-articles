require 'asciidoctor/converter/html5'
require 'asciidoctor/converter/composite'
require 'asciidoctor/converter/template'

module Asciidoctor
  module InstantArticles
    class Converter < ::Asciidoctor::Converter::CompositeConverter
      register_for 'instant-articles'
    end
  end
end
