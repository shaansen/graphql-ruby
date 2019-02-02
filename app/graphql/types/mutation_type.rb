module Types
  class MutationType < BaseObject
    field :create_link, mutation: Mutations::CreateLink
  end
end```

</Instruction>

### Testing with Playground

To test, just restart the server again and use the new mutation with GraphiQL:

![](http://i.imgur.com/pHNRZlG.png)

### Testing with Unit Test

It's a good practice in Ruby to unit test your resolver objects.

Here is an example of `Resolvers::CreateLink` test:

```ruby(path=".../graphql-ruby/test/graphql/mutations/create_link_test.rb")
require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new link' do
    user = create :user

    link = perform(
      url: 'http://example.com',
      description: 'description',
      user: user
    )

    assert link.persisted?
    assert_equal link.description, 'description'
    assert_equal link.url, 'http://example.com'
    assert_equal link.user, user
  end
end