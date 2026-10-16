class Curso 
    attr_reader :cod_curso
    attr_accessor :disciplinas
    def initialize(cod_curso)
      @cod_curso = cod_curso
      @disciplinas = Array.new
    end
end