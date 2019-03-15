class Task < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validate :validate_name_not_including_commma

  private

  def validate_name_not_including_commma
    errors.add(:name, 'not include comma') if name&.include?(',')
  end
end

