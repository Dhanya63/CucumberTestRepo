class LoginPage
  include PageObject

  page_url App::JDE_URL
  text_field(:user, :id => 'User')
  text_field(:password, :id => 'Password')
  button(:submit, :value => 'Sign In')

  def login(user_type)
    user_data = data_for :valid_users
    # puts user_data[user_type].inspect
    # puts user_data[user_type]["username"]
    self.user = user_data[user_type]["username"]
    self.password = user_data[user_type]["password"]
    submit
  end


end