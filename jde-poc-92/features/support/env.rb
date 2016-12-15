require 'rspec'
require 'page-object'
require 'data_magic'

World(PageObject::PageFactory)

DataMagic.yml_directory = 'config/data'
DataMagic.load 'users.yml'

module App
  def self.load_env_url
    JDE_ENV == 'PY' ? 'http://occ00dv780.simplot.com:8200/jde/E1Menu.maf' : 'https://jde92.simplot.com:8301/jde/E1Menu.maf'
  end

  JDE_VERSION = 9.2
  JDE_ENV = 'DV'
  JDE_URL = JDE_VERSION == 9.2 ? App.load_env_url : 'https://jde-dev.simplot.com:8101/jde/E1Menu.maf'


end


