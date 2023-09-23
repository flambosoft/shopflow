class VariantValue < ApplicationRecord
  belongs_to :variant
  belongs_to :option_value

  validates :value, presence: true
  validate :value_matches_option_type

  private

    def value_matches_option_type
      # Ensure that the value matches the expectations of the Option type.
      case option.option_type
      when "choice"
        unless option.option_values.map(&:value).include?(value)
          errors.add(:value, "is not a valid choice")
        end
      when "free_text"
        # Additional validation for text values if needed
      when "boolean"
        unless [true, false].include?(value)
          errors.add(:value, "is not a valid boolean")
        end
      when "measurement"
        # Ensure value is a valid number. Possibly extend this to handle units (cm, oz, grams, etc.)
        errors.add(:value, "is not a valid measurement") unless value.is_a?(Numeric)
      else
        # type code here
      end
    end
end
