module Mutations
  class CreateVote < BaseMutation
    argument :link_id, ID, required: false

    type Types::VoteType

    def resolve(link_id: nil)
      Vote.create!(
        link: GraphqlTutorialSchema.object_from_id(link_id, context),
        user: context[:current_user]
      )
    end
  end
end