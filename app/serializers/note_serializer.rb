class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :due_date, :completed, :user_id, :created_at
end
