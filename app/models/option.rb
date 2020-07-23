class Option < ApplicationRecord
  has_many :menu_options, dependent: :destroy
  has_many :menus, through: :menu_options
  has_many :orders
end
