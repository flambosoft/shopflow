class Option < ApplicationRecord
  enum option_type: { choice: 0, text: 1, boolean: 2, measurement: 3 }

  has_many :product_options, dependent: :destroy
  has_many :products, through: :product_options
  has_many :option_values, dependent: :destroy

  accepts_nested_attributes_for :option_values, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, uniqueness: true
  validates :option_type, presence: true
  validate :unique_option_values

  before_save :check_values

  private

  def check_values
    option_values.destroy_all unless choice?
  end

  def unique_option_values
    values = option_values.map(&:value)

    # Check for duplicate values in the current option_values set
    if values.uniq.length != values.length
      errors.add(:base, "Option values must be unique within the same option.")
      return
    end

    # For existing records, ensure uniqueness at the database level
    if persisted?
      overlapping_values = OptionValue.where(option: self).where(value: values).pluck(:value)
      overlapping_values.each do |val|
        count = option_values.select { |ov| ov.value == val }.count
        if count > 1
          errors.add(:base, "Option value '#{val}' is duplicated.")
          break
        end
      end
    end
  end

end
