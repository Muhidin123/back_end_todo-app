class NoteSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :category, :due_date, :completed, :user_id, :created_at
  belongs_to :user
end
