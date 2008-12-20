module ID3
  module TagBag
    
    class Base
      include Enumerable
      attr_reader :music_root
      
      def initialize(music_root)
        @music_root = music_root.to_s
      end
      
      def files
        @files ||= Dir[@music_root / '**/*.mp3']
      end
      
      def tags
        @tags ||= files.map {|f| ID3Lib::Tag.new(f) }
      end

      def each
        tags.each {|tag| yield tag }
      end

      def inspect
        "#<#{self.class} #{music_root.inspect}> #{$/}" << map do |tag|
          inspect_tag(tag)
        end.join
      end
      
      def inspect_tag(tag)
        ""
      end
      
      def to_s
        inspect
      end
    end

  end
end