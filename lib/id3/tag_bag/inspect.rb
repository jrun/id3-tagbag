module ID3
  module TagBag
    
    class Inspect < Base
      def run
        each do |tag|
          puts File.expand_path(tag.filename)
          puts tag.map {|frame| "   #{frame[:id]}: #{frame[:text] || frame[:description]}" } 
        end
      end
    end
    
  end
end