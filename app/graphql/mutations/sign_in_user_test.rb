require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(args)
  end

  def create_user
    User.create!(
      name: 'test user',
      email: '123@123.com',
      password: '123'
    )
  end

  test 'success' do
    user = create_user
    result = perform(
      credentials: {
        email: user.email,
        password: user.password
      }
    )
    p 'result ${result}'

    assert result[:token].present?
    assert_equal result[:user], user
  end

  test 'failure becuase no credentials' do
    assert_nil perform
  end

  test 'failure because wrong email' do
    create_user
    assert_nil perform(credentials: { email: 'wrong' })
  end

  test 'failure because wrong password' do
    user = create_user
    assert_nil perform(credentials: { email: user.email, password: 'wrong' })
  end
end
