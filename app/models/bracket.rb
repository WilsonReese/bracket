# == Schema Information
#
# Table name: brackets
#
#  id                :integer          not null, primary key
#  number_of_entries :integer
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  manager_id        :integer
#
class Bracket < ApplicationRecord

  belongs_to(:manager, { :required => false, :class_name => "User", :foreign_key => "manager_id" })
  has_many(:entries, { :class_name => "Entry", :foreign_key => "bracket_id", :dependent => :destroy })
end
