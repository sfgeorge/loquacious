module Loquacious
  class Utility
    class << self
      # Returns the variable name to use for a value to be picked from ENV
      # 
      def env_var_name(name, config)
        [::Loquacious.env_prefix, config.parent_list.join("_"), config.__name, name.to_s].join("_").upcase
      end
    end
  end
end
