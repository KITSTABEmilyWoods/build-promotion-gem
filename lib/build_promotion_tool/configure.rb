require 'yaml'
filepath = File.join(File.dirname(__FILE__), "config.yml")
CONFIG = YAML.load_file(filepath)

module Configure
  def self.tag_types
    CONFIG.fetch('tags')
  end
end
