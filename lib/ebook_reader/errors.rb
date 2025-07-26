# frozen_string_literal: true

module EbookReader
  # Base error class for EbookReader
  class Error < StandardError; end

  # Raised when EPUB file cannot be parsed
  class EPUBParseError < Error
    attr_reader :file_path

    def initialize(message, file_path)
      super("Failed to parse EPUB at #{file_path}: #{message}")
      @file_path = file_path
    end
  end

  # Raised when required file is not found
  class FileNotFoundError < Error
    attr_reader :file_path

    def initialize(file_path)
      super("File not found: #{file_path}")
      @file_path = file_path
    end
  end

  # Raised when configuration is invalid
  class ConfigurationError < Error; end

  # Raised when terminal is too small
  class TerminalSizeError < Error
    def initialize(width, height)
      min_width = Constants::UIConstants::MIN_WIDTH
      min_height = Constants::UIConstants::MIN_HEIGHT
      super("Terminal too small: #{width}x#{height}. Minimum required: #{min_width}x#{min_height}")
    end
  end
end

  # Raised when reader state is invalid
  class InvalidStateError < Error
    attr_reader :state

    def initialize(message, state)
      super("Invalid reader state: #{message}")
      @state = state
    end
  end

  # Raised when navigation is not possible
  class NavigationError < Error
    attr_reader :direction, :reason

    def initialize(direction, reason)
      super("Cannot navigate #{direction}: #{reason}")
      @direction = direction
      @reason = reason
    end
  end

  # Raised when bookmark operation fails
  class BookmarkError < Error
    attr_reader :operation

    def initialize(operation, message)
      super("Bookmark #{operation} failed: #{message}")
      @operation = operation
    end
  end

  # Raised when rendering fails
  class RenderError < Error
    attr_reader :component

    def initialize(component, message)
      super("Rendering failed in #{component}: #{message}")
      @component = component
    end
  end
