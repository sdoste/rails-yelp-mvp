class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :category, presence: true
  before_validation :downcase_category
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
  before_save :downcase_category

  private

  def downcase_category
    self.category.nil? ? "" : self.category.downcase!
  end
end
