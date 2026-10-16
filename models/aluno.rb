class Aluno
  attr_reader :matricula
  attr_accessor :disciplinas
  def initialize(matricula)
    @matricula = matricula
    @disciplinas = Array.new
  end
end