class Disciplina 
  attr_accessor :cod_disciplina, :cod_curso, :nota, :carga_horaria, :ano_semestre
  def initialize (cod_disciplina, cod_curso, nota, carga_horaria, ano_semestre)
    @cod_disciplina = cod_disciplina
    @cod_curso = cod_curso
    @nota = nota
    @carga_horaria = carga_horaria
    @ano_semestre = ano_semestre
  end
end