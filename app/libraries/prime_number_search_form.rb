class PrimeNumberSearchForm
  include ActiveModel::Validations

  attr_accessor :prime_number,:prime_number_from, :prime_number_to,
                :twins_prime_number_from, :twins_prime_number_to,
                :prime_triplet_from, :prime_triplet_to,
                :prime_quadruplet_from, :prime_quadruplet_to

  validate do
    case # single 素数validation
      when prime_number && prime_number.match(/\D/)
        errors.add(:base, '「素数検索」はすべて数字で入力してください。')
    end
    case # 素数範囲検索validation
      when prime_number_from && prime_number_from.match(/\D/) || prime_number_to && prime_number_to.match(/\D/)
        errors.add(:base, '「範囲検索」はすべて数字で入力してください。')
      when (prime_number_from.present? && prime_number_to.present?) && prime_number_to < prime_number_from
        errors.add(:base, '素数検索数字の順序が反対です。')
      when prime_number_from.present? && prime_number_to.blank?
        errors.add(:base, '「範囲検索」において範囲の終わりを入力して下さい')
    end
    case # 双子素数validation
      when twins_prime_number_from && twins_prime_number_from.match(/\D/) || twins_prime_number_to && twins_prime_number_to.match(/\D/)
        errors.add(:base, '「双子素数検索」は、すべて数字で入力してください。')
      when (twins_prime_number_from.present? && twins_prime_number_to.present?) && twins_prime_number_to < twins_prime_number_from
        errors.add(:base, '「双子素数検索」において数字の順序が反対です。')
      when twins_prime_number_from.present? && twins_prime_number_to.blank?
        errors.add(:base, '「双子素数検索」において範囲の終わりを入力して下さい')
    end
    case # 三つ子素数validation
      when prime_triplet_from && prime_triplet_from.match(/\D/) || prime_triplet_to && prime_triplet_to.match(/\D/)
        errors.add(:base, '「三つ子素数検索」は、すべて数字で入力してください。')
      when (prime_triplet_from.present? && prime_triplet_to.present?) && prime_triplet_to < prime_triplet_from
        errors.add(:base, '「三つ子素数検索」において数字の順序が反対です。')
      when prime_triplet_from.present? && prime_triplet_to.blank?
        errors.add(:base, '「三つ子素数検索」において範囲の終わりを入力して下さい')
    end
    case # 四つ子素数validation
      when prime_quadruplet_from && prime_quadruplet_from.match(/\D/) || prime_quadruplet_to && prime_quadruplet_to.match(/\D/)
        errors.add(:base, '「四つ子素数検索」は、すべて数字で入力してください。')
      when (prime_quadruplet_from.present? && prime_quadruplet_to.present?) && prime_quadruplet_to < prime_quadruplet_from
        errors.add(:base, '「四つ子素数検索」において数字の順序が反対です。')
      when prime_quadruplet_from.present? && prime_quadruplet_to.blank?
        errors.add(:base, '「四つ子素数検索」において範囲の終わりを入力して下さい')
    end
  end

  def initialize(params)
    if params
      params.each do |key, val|
        send("#{key}=", val) if respond_to?(key)
      end
    end
  end

end
