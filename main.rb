require "csv"
require_relative "models/disciplina.rb"
require_relative "models/aluno.rb"

alunos = Hash.new

CSV.foreach("dataset/notas.csv", headers: true, col_sep: ",") do |linha|
  disciplina = Disciplina.new(linha["COD_DISCIPLINA"], linha["COD_CURSO"], linha["NOTA"].to_f, linha["CARGA_HORARIA"].to_i, linha["ANO_SEMESTRE"])
  if alunos[linha["MATRICULA"]]
    x = linha["MATRICULA"]
    alunos[x].ch_total += disciplina.carga_horaria
    alunos[x].disciplinas.push(disciplina)
  else
    aluno = Aluno.new(linha["MATRICULA"])
    aluno.disciplinas.push(disciplina)
    aluno.ch_total += disciplina.carga_horaria
    alunos[linha["MATRICULA"]] = aluno
  end
end

puts "------- O CR dos alunos é: --------"
alunos.values.each do |aluno|
  puts "#{aluno.matricula} - #{aluno.calcula_cr}"
end
puts "-----------------------------------\n----- Média de CR dos cursos ------"
