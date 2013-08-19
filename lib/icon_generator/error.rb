module IconGenerator
    class Error < Thor::Error
        # Colors the given error message red and sends it up to
        # Thor::Error's initialize method.
        #
        # @param message [String] the message for the current Error
        def initialize(message = "Icon generation failed")
            super(Thor::Shell::Color.new.set_color message, :red)
        end
    end
end
