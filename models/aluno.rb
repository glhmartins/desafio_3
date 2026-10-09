class Aluno
  attr_reader :matricula
  attr_accessor :disciplinas
  def initialize(matricula)
    @matricula = matricula
    @disciplinas = Array.new
  end

  def calcula_cr
    cr = 0
    ch_total = 0
    disciplinas.each do |disciplina|
      cr += disciplina.nota*disciplina.carga_horaria
      ch_total += disciplina.carga_horaria
    end
    cr /= ch_total
    cr.round(1)
  end
end