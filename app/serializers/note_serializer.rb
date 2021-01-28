class NoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :category, :due_date, :completed, :user_id
  belongs_to :user
end
