module ID3
  module TagBag
    
    class Anonymizer
      def initialize(music_root)
        @music_root = music_root.to_s
      end
      
      def tags
        @tags ||=  Dir[@music_root / '**/*.mp3'].map do |f|          
          ID3Lib::Tag.new(f)
        end.find_all do |tag|
          ! tag.comment.blank? || 
          ! tag.encoded_by.blank? ||
          ! tag.publisher.blank?
        end
      end
      
      def each
        tags.each {|tag| yield tag }
      end
      
      def run
        each do |tag|
          unless tag.comment.blank?
            tag.comment = ""
          end
          unless tag.encoded_by.blank?
            tag.encoded_by = ""
          end
          unless tag.publisher.blank?
            tag.publisher = ""
          end
          begin
            tag.update!
            puts "Updated #{tag.title}"
          rescue => e
            puts "Failed to update #{tag.title}: #{e.message}"
          end
        end
      end

      def inspect # :nodoc:
        "#<#{self.class} #{@music_root.inspect}>#{$/}" <<
        tags.map do |tag|
          d = Dictionary.new
          d[:comment] = tag.comment if tag.comment
          d[:encoded_by] = tag.encoded_by if tag.encoded_by
          d[:publisher] = tag.publisher if tag.publisher
          "#{tag.title}#{$/}  #{d.inspect}#{$/}"
        end.join($/)
      end
      alias :to_s :inspect
    end
    
  end
end