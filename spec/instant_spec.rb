RSpec.describe Asciidoctor::InstantArticles::Converter, "#convert" do
  context "basic convert test" do
    it "should convert adoc to instant article based html5" do
      file = File.new 'test/examples/asciidoc-html/instant-articles01.adoc'
      puts Asciidoctor.convert file, backend: 'instant-articles'
    end
  end
end
