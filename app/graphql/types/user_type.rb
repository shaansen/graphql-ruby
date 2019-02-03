module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :created_at, DateTimeType, null: false
    field :name, String, null: false
    field :email, String, null: false
  end
end