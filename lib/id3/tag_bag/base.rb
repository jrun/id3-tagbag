module ID3
  module TagBag
    
    class Base
      include Enumerable
      attr_reader :music_root
      
      def initialize(music_root)
        @music_root = music_root.to_s
      end
      
      def tags
        @tags ||= Dir[@music_root / '**/*.mp3'].map {|f| ID3Lib::Tag.new(f) }
      end

      def each
        tags.each {|tag| yield tag }
      end

      def inspect
        "#<#{self.class} #{music_root.inspect}> #{$/}"
      end

      def to_s
        inspect
      end
    end

  end
end