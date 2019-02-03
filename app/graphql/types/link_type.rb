module Types
  class LinkType < BaseObject
    field :id, ID, null: false
    field :created_at, DateTimeType, null: false
    field :url, String, null: false
    field :description, String, null: false
    # "method" option remaps field to an attribute of Link model
    field :posted_by, UserType, null: false, method: :user
  end
end