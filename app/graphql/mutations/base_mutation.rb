module Mutations
  # This class is used as a parent for all mutations, and it is the place to have common utilities
  # class BaseMutation < GraphQL::Schema::RelayClassicMutation
  #   argument_class Types::BaseArgument
  #   field_class Types::BaseField
  #   input_object_class Types::BaseInputObject
  #   object_class Types::BaseObject
  # end
  class BaseMutation < GraphQL::Schema::Mutation
    null false
  end
end
