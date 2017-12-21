require './lib/cocinero'
require 'test/unit'

class TestCocinero < Test::Unit::TestCase
    def setup
        @cocinero1 = Cocinero.new(9)
    end
    def test_cocinero
        t1 = Thread.new do
           loop do
              @cocinero1.uno_mas()
              sleep 3
           end
        end
        t2 = Thread.new do
           loop do
               comer = @cocinero1.degustar_uno()
               sleep 3
               if comer==true
                  puts "El plato es delicioso" 
               else
                  puts "Lo siento no hay platos que comer"
               end
               puts "El probador de platos espera con paciencia"
           end
        end
        t1.join
        t2.join
        #assert_equal("", @cocinero1.to_s)
    end
end
