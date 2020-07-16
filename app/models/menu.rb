class Menu < ApplicationRecord
  belongs_to :organisation
  has_many :menu_options, dependent: :destroy
  has_many :options, through: :menu_options, dependent: :destroy
  accepts_nested_attributes_for :menu_options, allow_destroy: true
end
