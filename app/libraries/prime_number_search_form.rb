class PrimeNumberSearchForm
  include ActiveModel::Validations

  attr_accessor :prime_number,:prime_number_from, :prime_number_to,
                :twins_prime_number_from, :twins_prime_number_to

  validate do
    case
      when prime_number.match(/\D/)
        errors.add(:base, '「素数検索」はすべて数字で入力してください。')
    end
    case
      when prime_number_from && prime_number_from.match(/\D/) || prime_number_to && prime_number_to.match(/\D/)
        errors.add(:base, '「範囲検索」はすべて数字で入力してください。')
      when (prime_number_from.present? && prime_number_to.present?) && prime_number_to < prime_number_from
        errors.add(:base, '素数検索数字の順序が反対です。')
      when prime_number_from.present? && prime_number_to.blank?
        errors.add(:base, '「範囲検索」において範囲の終わりを入力して下さい')
    end
    case
      when twins_prime_number_from && twins_prime_number_from.match(/\D/) || twins_prime_number_to && twins_prime_number_to.match(/\D/)
        errors.add(:base, '「双子素数検索」は、すべて数字で入力してください。')
      when (twins_prime_number_from.present? && twins_prime_number_to.present?) && twins_prime_number_to < twins_prime_number_from
        errors.add(:base, '「双子素数検索」において数字の順序が反対です。')
      when twins_prime_number_from.present? && twins_prime_number_to.blank?
        errors.add(:base, '「双子素数検索」において範囲の終わりを入力して下さい')
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
