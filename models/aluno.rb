class Aluno
  attr_reader :matricula
  attr_accessor :disciplinas, :ch_total
  def initialize(matricula)
    @matricula = matricula
    @disciplinas = Array.new
    @ch_total = 0
  end

  def calcula_cr
    cr = 0
    disciplinas.each do |disciplina|
      cr += disciplina.nota*disciplina.carga_horaria
    end
    cr /= ch_total
    cr.round(1)
  end
end