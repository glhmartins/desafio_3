require "csv"
require_relative "models/disciplina.rb"
require_relative "models/aluno.rb"
require_relative "models/curso.rb"

alunos = Hash.new
cursos = Hash.new

CSV.foreach("dataset/notas.csv", headers: true, col_sep: ",") do |linha|
  disciplina = Disciplina.new(linha["COD_DISCIPLINA"], linha["COD_CURSO"], linha["NOTA"].to_f, linha["CARGA_HORARIA"].to_i, linha["ANO_SEMESTRE"])
  unless alunos[linha["MATRICULA"]]
    aluno = Aluno.new(linha["MATRICULA"])
    alunos[linha["MATRICULA"]] = aluno
  end
  unless cursos[linha["COD_CURSO"]]
    curso = Curso.new(linha["COD_CURSO"])
    cursos[linha["COD_CURSO"]] = curso
  end
  alunos[linha["MATRICULA"]].disciplinas.push(disciplina)
  cursos[linha["COD_CURSO"]].disciplinas.push(disciplina)
end

puts "------- O CR dos alunos é: --------"
alunos.values.each do |aluno|
  puts "#{aluno.matricula} - #{aluno.calcula_cr}"
end

puts "-----------------------------------"

puts "-----Média de CR dos cursos ------"
cursos.keys.sort_by(&:to_i).each do |cod_curso|
  puts "#{cod_curso} - #{cursos[cod_curso].cr_medio}"
end
