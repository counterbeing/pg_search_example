class Child < ActiveRecord::Base
  include PgSearch
  attr_accessible :name, :parent_id
  belongs_to :parent

  # The following line is causing the issue...
  default_scope joins(:parent).order('parents.name asc')

  # This is the search scope to run... Try `Child.search_by_child("associated parent name here")`
  # You'll need to create a couple of parents and children, populate the children with some parent_ids and give it a shot.
  pg_search_scope :search_by_child, :against => [:name], :associated_against => {:parent => [:name]}
end
