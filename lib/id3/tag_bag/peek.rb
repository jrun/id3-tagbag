module ID3
  module TagBag
    
    class Peek < Base
      def run(frame)
        each do |tag|
          tag_frame = tag.frame_text(frame.to_sym)
          unless tag_frame.blank?
            puts "#{$/}#{tag.title}: #{frame} => #{tag_frame}"
          end
        end
      end     
    end
    
  end
end