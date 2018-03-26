module SequenceFinder
  class << self
    def sequence_finder
      @initial_primes = Prime.take_while {|p| p < 500000 }.sort.reverse
      @collected_primes = []
      @collected_primes_list = [0,[0]]
      @addition_count = 0
      @initial_primes.each do |ele|
        @addition_count += ele
        @collected_primes << ele
        if @addition_count>1000000
          @addition_count = 0
          @collected_primes = []
        elsif @addition_count.prime? && @addition_count<1000000
          if @collected_primes_list.last.size<@collected_primes.size
            @collected_primes_list = []
            @collected_primes_list = [@collected_primes.size, @collected_primes]
          end
        end
      end
      @collected_primes_list
    end
  end
end

require 'active_support'
require 'active_support/core_ext'
class LongestSequencePrime 
  def self.collect_longest_prime_sequence
    @longest_sequence = SequenceFinder.sequence_finder
    puts "Summation as Prime Number => #{@longest_sequence.last.sum}"
    puts "Sequence Prime Numbers => #{@longest_sequence.last.reverse}"
  end
end
class Fixnum (require 'prime'); end
LongestSequencePrime.collect_longest_prime_sequence
