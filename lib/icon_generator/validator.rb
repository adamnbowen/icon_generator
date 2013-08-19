module IconGenerator
    module Validator
        # Validates the given source image file and the destination
        # directory for correctness.
        #
        # @param source [String] the source image file
        # @param destination [String] the output directory
        def validate_arguments(source, destination)
            raise IconGenerator::Error, '1st argument must be a valid image' unless source.match /\.gif$|\.jpg$|\.png$/
            raise IconGenerator::Error, '1st argument must be an existing file' unless File.exists? source
            raise IconGenerator::Error, '2nd argument must be an existing directory' unless Dir.exists? destination
        end

        # Validates the existence of the given file.
        #
        # @param filename [String] the file being tested for existence
        def validate_file_status(filename)
            raise IconGenerator::Error unless File.exists? filename
        end
    end
end
