class Parent < ActiveRecord::Base
  include PgSearch

  default_scope order('name asc')
  attr_accessible :name
  has_many :children
end
