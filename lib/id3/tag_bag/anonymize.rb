module ID3
  module TagBag
    
    class Anonymize < Base
      FrameIds = [:COMM, :TCOP, :TENC, :TPUB, :USER]
      
      def run(dry_run)
        each do |tag|
          update = false
          FrameIds.each do |id|
            unless (text = tag.frame_text(id)).nil?
              tag.set_frame_text(id, nil) unless dry_run
              puts %Q[#{id} - Removed "#{text}"]
              update = true
            end
          end
          next unless update
          begin
            tag.update! unless dry_run
            puts "Updated #{tag.filename}"
          rescue => e
            puts "Failed to update #{tag.filename}: #{e.message}"
          end
        end
      end
    end
    
  end
end