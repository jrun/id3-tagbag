module ID3Lib
  class Tag
    def filename
      File.expand_path(@filename)
    end
  end
end