class SearchForm
  include ActiveModel::Model

  attr_accessor :prime_number,:prime_number_from, :prime_number_to,
                :twins_prime_number_from, :twins_prime_number_to,
                :prime_triplet_from, :prime_triplet_to,
                :prime_quadruplet_from, :prime_quadruplet_to

  def initialize(params)
    if params[:prime_form]
      params[:prime_form].each do |key, val|
        instance_variable_set(('@' + key).to_sym, val.to_i)
      end
    end
  end

  validates :prime_number,:prime_number_from, :prime_number_to,
            :twins_prime_number_from, :twins_prime_number_to,
            :prime_triplet_from, :prime_triplet_to,
            :prime_quadruplet_from, :prime_quadruplet_to,
            numericality: { only_integer: true, allow_blank: true }

  # validate do # 素数範囲検索validation
  #   if (prime_number_from.present? && prime_number_to.present?) && prime_number_to.to_i < prime_number_from.to_i
  #     errors.add(:base, '数字の大小が反対です。')
  #   elsif prime_number_from.present? && prime_number_to.blank?
  #     errors.add(:base, '後に続く数字を入力して下さい。')
  #   end
  # end

  # validate do # 双子素数validation
  #   if (twins_prime_number_from.present? && twins_prime_number_to.present?) && twins_prime_number_to.to_i < twins_prime_number_from.to_i
  #     errors.add(:base, '数字の大小が反対です。')
  #   elsif twins_prime_number_from.present? && twins_prime_number_to.blank?
  #     errors.add(:base, '後に続く数字を入力して下さい。')
  #   end
  # end

  # validate do # 三つ子素数validation
  #   if (prime_triplet_from.present? && prime_triplet_to.present?) && prime_triplet_to.to_i < prime_triplet_from.to_i
  #     errors.add(:base, '数字の大小が反対です。')
  #   elsif prime_triplet_from.present? && prime_triplet_to.blank?
  #     errors.add(:base, '後に続く数字を入力して下さい。')
  #   end
  # end

  # validate do # 四つ子素数validation
  #   if (prime_quadruplet_from.present? && prime_quadruplet_to.present?) && prime_quadruplet_to.to_i < prime_quadruplet_from.to_i
  #     errors.add(:base, '数字の大小が反対です。')
  #   elsif prime_quadruplet_from.present? && prime_quadruplet_to.blank?
  #     errors.add(:base, '後に続く数字を入力して下さい。')
  #   end
  # end

  ### 素数検索 ###

  def prime?
    sqrt = Math.sqrt(@prime_number)
    factor_found = (2..sqrt).any? { |i| @prime_number % i == 0 }
    unless factor_found || @prime_number == 1 || @prime_number == 0
      true
    else
      false
    end
  end

  def range_prime
    PrimeNumber.where(prime_number: [@prime_number_from..@prime_number_to])
               .pluck(:prime_number)
  end

  ### 双子素数検索 ###
  def twins_range_prime
    prime = PrimeNumber.where(prime_number: [@twins_prime_number_from..@twins_prime_number_to])
                       .pluck(:prime_number).flatten
    prime.each_cons(2).select{ |b, r| (r - b) == 2}
  end

  ### 三つ子素数検索　###
  def prime_triplet(prime_triplet_from, prime_triplet_to)
    results = prime(prime_triplet_from, prime_triplet_to).to_a.flatten
    results.each_cons(3).select{ |a, b, c| (b - a == 2 && c - a == 6) || (b - a == 4 && c - a == 6) }
  end

  ### 四つ子素数検索　###
  def prime_quadruplet(prime_quadruplet_from, prime_quadruplet_to)
    results = prime(prime_quadruplet_from, prime_quadruplet_to).to_a.flatten
    results.each_cons(4).select{ |a, b, c, d| (b - a == 2 && c - a == 6 && d - a == 8) }
  end

  private
  def prime(int_a, int_b)
    ActiveRecord::Base.connection.execute("SELECT prime_number FROM prime_numbers WHERE
    (#{int_a.to_i} < prime_number and prime_number < #{int_b.to_i})")
  end
end
