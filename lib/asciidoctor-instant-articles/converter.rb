require 'asciidoctor/converter/html5'
require 'asciidoctor/converter/composite'
require 'asciidoctor/converter/template'

module Asciidoctor
  module InstantArticles
    class Converter < ::Asciidoctor::Converter::CompositeConverter
      register_for 'instant-articles'

      ProvidedTemplatesDir = ::File.expand_path '../../../templates', __FILE__
      SlimPrettyOpts = { pretty: true, indent: false }.freeze

      def initialize backend, opts={}
        template_dirs = [ProvidedTemplatesDir] # last dir wins
        if (custom_template_dirs = opts[:template_dirs])
          template_dirs += custom_template_dirs.map {|d| ::File.expand_path d }
        end
        include_dirs = template_dirs.reverse.tap {|c| c << (::File.join c.pop, 'slim') } # first dir wins
        engine_opts = (opts[:template_engine_options] || {}).dup
        extra_slim_opts = { include_dirs: include_dirs }
        extra_slim_opts.update SlimPrettyOpts if Set.new(%w(1 true)).include?(ENV['SLIM_PRETTY'].to_s)
        engine_opts[:slim] = (engine_opts.key? :slim) ? (extra_slim_opts.merge engine_opts[:slim]) : extra_slim_opts
        template_opts = opts.merge htmlsyntax: 'html', template_engine: 'erb', template_engine_options: engine_opts
        template_converter = ::Asciidoctor::Converter::TemplateConverter.new backend, template_dirs, template_opts
        html5_converter = ::Asciidoctor::Converter::Html5Converter.new backend, opts
        super backend, template_converter, html5_converter
        basebackend 'html'
        htmlsyntax 'html'
      end

      # def convert node, transform=nil, opts={}
      # end
    end
  end
end
