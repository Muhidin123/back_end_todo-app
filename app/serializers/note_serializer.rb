class NoteSerializer < ActiveModel::Serializer
  attributes object.all
end
