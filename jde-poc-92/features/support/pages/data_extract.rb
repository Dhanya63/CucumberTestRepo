class Data_Extract
  require 'yaml'

  def extract_approver_id()
    config = YAML.load 'config/data/users.yml'
    config[]
  end
end
