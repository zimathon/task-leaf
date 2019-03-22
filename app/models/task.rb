class Task < ApplicationRecord
  has_one_attached :image

  def self.ransackable_attributes(auth_object=nil)
    %w[name created_at]
  end
  def self.ransackable_associations(auth_object=nil)
    []
  end
  validates :name, presence: true, length: {maximum: 30}
  validate :validate_name_not_including_commma

  belongs_to :user

  scope :recent, -> { order(created_at: :desc)}
  scope :older, -> { order(created_at: :asc)}

  private

  def validate_name_not_including_commma
    errors.add(:name, 'not include comma') if name&.include?(',')
  end
end
