require 'spec_helper'

describe EPUBInfo::Models::Identifier do
  context 'EPUB2' do
    subject { EPUBInfo::Models::Identifier.new(Nokogiri::XML(File.new('spec/support/xml/metamorphosis_metadata_epub2.opf')).css('metadata').xpath('.//dc:identifier', EPUBInfo::Utils::DC_NAMESPACE).first) }

    its(:identifier) { should == 'http://www.gutenberg.org/ebooks/5200' }
    its(:scheme) { should == 'URI' }
  end

  context 'EPUB3' do
    subject { EPUBInfo::Models::Identifier.new(Nokogiri::XML(File.new('spec/support/xml/wasteland_metadata_epub3.opf')).css('metadata').xpath('.//dc:identifier', EPUBInfo::Utils::DC_NAMESPACE).first) }

    its(:identifier) { should == 'code.google.com.epub-samples.wasteland-basic' }
  end
end

