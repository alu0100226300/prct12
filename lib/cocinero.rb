require 'thread'

class Cocinero
  # método inicializar clase
  def initialize(contador)
    # atributos
    @experiencia = 0
    @contador = contador
    @anos = 0
    @platos = 0
    @lock = Mutex.new
  end

  def uno_mas()
     @lock.synchronize{
        @anos = @anos + 1
        @experiencia = @experiencia + 3
        case @experiencia
              when 1..10 then puts "El cocinero está siendo entrenado"
              when 11..21 then @platos = @platos + 1
              when 22..32 then @platos = @platos + 2
              when 33..43 then @platos = @platos + 3
        else
              @platos = @platos + 4
        end
     }
  end

  def degustar_uno()
     @lock.synchronize{
        @contador = @contador - 1
        if @contador == 0
           puts "El cocinero se ha retirado"
           puts "En total ha cocinado #{@platos} platos en #{@anos} años"
	   exit
        else
           if @experiencia >= 10
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

  def get_anos()
     return @anos
  end
  
  def get_contador()
     return contador
  end

  #salida por pantalla de clase
  def to_s
	s = "\n"
	s << "\nExperiencia: #{@experiencia}"
	s << "\nContador: #{@contador}"
        s << "\nAños: #{@anos}"
	s << "\n"
	s
  end
end
