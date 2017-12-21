require 'thread'

class Cocinero
  # método inicializar clase
  def initialize(contador)
    # atributos
    @experiencia = 0
    @contador = contador
    @total_platos = 0
    @platos = 0
    @lock = Mutex.new
  end

  def uno_mas()
     @lock.synchronize{
        @experiencia += 1
        case @experiencia
              when 1..2 then puts "El cocinero está siendo entrenado"
              when 3..5 then 
                 @platos += 1
                 @total_platos += 1
              when 6..9 then 
                 @total_platos += 2
                 @platos += 2
              when 10..14 then 
                 @platos += 3
                 @total_platos += 3
        else
              @platos += 4
              @total_platos += 4
        end
     }
  end

  def degustar_uno()
     @lock.synchronize{
        @contador -= 1
        if @contador == 0
           puts "El cocinero se ha retirado"
           puts "En total ha cocinado #{@total_platos} platos"
	   exit
        else
           if @platos > 0
              @platos -= 1
	      return true
           else
              return false
           end
        end
     }
  end

  def get_experiencia()
     return @experiencia
  end

  def get_total_platos()
     return @total_platos
  end
  
  def get_contador()
     return contador
  end

  #salida por pantalla de clase
  def to_s
	s = "\n"
	s << "\nExperiencia: #{@experiencia}"
	s << "\nContador: #{@contador}"
	s << "\nPlatos que quedan: #{@platos}"
        s << "\nPlatos en total: #{@total_platos}"
	s << "\n"
	s
  end
end
