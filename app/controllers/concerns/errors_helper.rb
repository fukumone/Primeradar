module ErrorsHelper
  def check_prime_number
    @error = {}

    if params[:prime_number].present?
      box = params[:prime_number].split(" ")
      arr = []
      box.each do |box|
        arr << true unless box =~ /\A[0-9]+\z/
      end
      @error[:prime_number] = "※半角数字で記入してください" if arr.present?
    end
  end
end
