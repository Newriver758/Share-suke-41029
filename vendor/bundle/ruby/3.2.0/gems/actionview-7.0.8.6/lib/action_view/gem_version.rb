# frozen_string_literal: true

module ActionView
  # Returns the currently loaded version of Action View as a <tt>Gem::Version</tt>.
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 7
    MINOR = 0
    TINY  = 8
    PRE   = "6"

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join(".")
  end
end
