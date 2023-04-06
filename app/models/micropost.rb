class Micropost < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  has_one_attached :image
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: I18n.t("validate.image") },
                    size: { less_than: 5.megabytes, message: I18n.t("validate.max_size_image") }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
