class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments

  has_one_attached :photo

  before_validation :normalize_species
  before_save :capitalize_name

  validates :name, :species, :date_of_birth, :weight, :owner, presence: true
  validates :species, inclusion: { in: %w[dog cat rabbit bird reptile other] }
  validates :weight, numericality: { greater_than: 0 }

  validate :date_of_birth_cannot_be_in_the_future
  validate :acceptable_photo

  scope :by_species, ->(species) { where(species: species) }

  def normalize_species
    self.species = species.strip.downcase if species
  end

  def capitalize_name
    self.name = name.strip.capitalize if name
  end

  def date_of_birth_cannot_be_in_the_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "ERROR: FECHA EN EL FUTURO")
    end
  end

  def acceptable_photo
    return unless photo.attached?

    unless photo.blob.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:photo, "must be a JPEG, PNG, or WebP image")
    end

    if photo.blob.byte_size > 5.megabytes
      errors.add(:photo, "must be less than 5 MB")
    end
  end
end