# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  status     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bracket_id :integer
#
class Entry < ApplicationRecord

  belongs_to(:bracket, { :required => false, :class_name => "Bracket", :foreign_key => "bracket_id" })
end
