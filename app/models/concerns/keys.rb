module Keys
  extend ActiveSupport::Concern

  # public static method
  def self.generate(n = 8)
    rand(36**n).to_s(36)
  end

  included do
    before_validation(on: :create) do
      (self.deleted = false) if respond_to?(:deleted)

      ensure_key if respond_to?(:key)
    end

    scope :by_key, -> (key){ where(key: key) }
  end

  def key_size
    8
  end

  def ensure_key(and_save = false)
    self.key = Keys.generate(key_size) if key.blank?
    save! if and_save
    key
  end

  def base_url
    return account.custom_domain if respond_to?(:account) && account.custom_domain.present?
    ENV['FRONTEND_URL'].to_s
  end
end