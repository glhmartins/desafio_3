class Curso 
    attr_reader :cod_curso
    attr_accessor :disciplinas
    def initialize(cod_curso)
      @cod_curso = cod_curso
      @disciplinas = Array.new
    end
    def cr_medio
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