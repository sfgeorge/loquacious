module Loquacious
  class Utility
    class << self
      # Returns the variable name to use for a value to be picked from ENV
      #
      def env_var_name(name, config)
        parent_list = config.parent_list
        parent_part = parent_list.empty? ? nil : parent_list.join("_")
        key_name = name.to_s.split(".").last
        [::Loquacious.env_prefix, parent_part, config.__name, key_name].compact.join("_").upcase
      end
    end
  end
end
