# == Schema Information
#
# Table name: prime_numbers
#
#  id           :integer          not null, primary key
#  prime_number :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class PrimeNumber < ActiveRecord::Base
end
