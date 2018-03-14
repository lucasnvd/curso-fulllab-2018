# Arrays
# Declarando um array
array = []

# Adicionando um item ao array
array << 'ola'
# ou
array.push('mundo')
puts "array: #{array}"

# Removendo do array
array.delete('ola')
puts "array: #{array}"

# Inserindo em uma determinada posicao
array.insert(0, 'ola2')

# Join
puts "join: #{array.join(',')}"

# mudando o valor de um determinado indice
array[0] = 'olaaa'
puts array.to_s

# Localizando um indice de um determinado objeto
# Queremos todos indices dos usuarios que tenham mais
# de 24 anos

# Declarando a classe para gerar as instancias dos
# usuarios no array
class User
  # Declarando constantes
  FAKE_NAMES = ['lucas', 'helena', 'vinicius', 'matheus', 'pedro', 'gustavo', 'ricardo'].freeze

  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age  = age
  end
end

# Criando o array com os usuarios
i = 0
users = User::FAKE_NAMES.map do |n|
  i = i + 1
  User.new(n, (i) * 10)
end

# pegando os usarios maiores de 30 anos
users.select { |u| u.age > 30 }

# excluindo usuarios com mais de 60 anos
users.reject { |u| u.age > 60 }

# Diferenca map x each

# O each executa a iteracao porem nao retorna
# os valores finais de cada bloco iterado
array_x = users.each do |u|
  u.age = u.age - 1
end

# Ja o map, realiza o mesmo procedimento, no entanto,
# retorna um novo array com os valores finais de cada
# iteracao
array_y = users.map { |u| u.age }
# ou
array_z = users.map(&:age)

puts array_x.to_s
puts array_z.to_s

array_2d = [
    ['lucas', 24, 'lucas@fulllab.com.br'],
    ['helena', 30, 'helena@fulllab.com.br'],
    ['matheus', 56, 'matheus@fulllab.com.br']
]

# mapeando os indices nos argumentos, desta forma
# ao inves de utilizar array[0], array[1] para acessar
# o valor de um determinado indice, vc mapeia como se
# fosse uma variavel
array_2d.each { |(name, age, email)| puts "Name: #{name} | Age: #{age} | Email: #{email}" }
