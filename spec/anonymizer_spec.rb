require File.dirname(__FILE__) + '/spec_helper'

describe ID3::TagBag::Anonymizer do
  it "should print mp3s that have a comment or encoded_by" do
    puts ID3::TagBag::Anonymizer.new(ENV['HOME'] / 'Music')
  end
end