require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create a new link' do
    link = perform(
      url: 'example-test.url',
      description: 'some desc',
    )

    assert link.persisted?
    assert_equal link.description, 'some desc'
    assert_equal link.url, 'example-test.url'
  end
end