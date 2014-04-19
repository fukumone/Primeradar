class PrimeNumberSearchForm
  include ActiveModel::Validations

  attr_accessor :prime_number,:prime_number_from, :prime_number_to,
                :twins_prime_number_from, :twins_prime_number_to,
                :prime_triplet_from, :prime_triplet_to,
                :prime_quadruplet_from, :prime_quadruplet_to

  def initialize(params)
    if params
      params.each do |key, val|
        send("#{key}=", val) if respond_to?(key)
      end
    end
  end

  validates :prime_number,:prime_number_from, :prime_number_to,
            :twins_prime_number_from, :twins_prime_number_to,
            :prime_triplet_from, :prime_triplet_to,
            :prime_quadruplet_from, :prime_quadruplet_to,
            numericality: { only_integer: true, allow_blank: true }

  validate do # 素数範囲検索validation
    if (prime_number_from.present? && prime_number_to.present?) && prime_number_to.to_i < prime_number_from.to_i
      errors.add(:base, '数字の大小が反対です。')
    elsif prime_number_from.present? && prime_number_to.blank?
      errors.add(:base, '後に続く数字を入力して下さい。')
    end
  end

  validate do # 双子素数validation
    if (twins_prime_number_from.present? && twins_prime_number_to.present?) && twins_prime_number_to.to_i < twins_prime_number_from.to_i
      errors.add(:base, '数字の大小が反対です。')
    elsif twins_prime_number_from.present? && twins_prime_number_to.blank?
      errors.add(:base, '後に続く数字を入力して下さい。')
    end
  end

  validate do # 三つ子素数validation
    if (prime_triplet_from.present? && prime_triplet_to.present?) && prime_triplet_to.to_i < prime_triplet_from.to_i
      errors.add(:base, '数字の大小が反対です。')
    elsif prime_triplet_from.present? && prime_triplet_to.blank?
      errors.add(:base, '後に続く数字を入力して下さい。')
    end
  end

  validate do # 四つ子素数validation
    if (prime_quadruplet_from.present? && prime_quadruplet_to.present?) && prime_quadruplet_to.to_i < prime_quadruplet_from.to_i
      errors.add(:base, '数字の大小が反対です。')
    elsif prime_quadruplet_from.present? && prime_quadruplet_to.blank?
      errors.add(:base, '後に続く数字を入力して下さい。')
    end
  end

end
