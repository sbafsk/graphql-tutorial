require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create new user' do
    user = perform(
      name: 'Test user',
      auth_provider: {
        credentials: {
          email: '123@123.com',
          password: '[omitted]'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, 'Test user'
    assert_equal user.email, '123@123.com'
  end
end