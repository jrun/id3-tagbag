module ID3
  module TagBag
    
    class Anonymizer < Base      
      def tags
        @tags ||= super.find_all do |tag|
          ! (tag.comment.blank? && tag.encoded_by.blank? && tag.publisher.blank?)
        end
      end
      
      def run
        each do |tag|
          tag.comment = "" unless tag.comment.blank?
          tag.encoded_by = "" unless tag.encoded_by.blank?
          tag.publisher = "" unless tag.publisher.blank?
          begin
            tag.update!
            puts "Updated #{tag.title}"
          rescue => e
            puts "Failed to update #{tag.title}: #{e.message}"
          end
        end
      end

      def inspect_tag(tag)
        %Q[#{$/}#{tag.title}#{$/}  {:comment => '#{tag.comment}', :encoded_by => #{tag.encoded_by}, :publisher => #{tag.publisher}} #{$/}]
      end
    end
    
  end
end