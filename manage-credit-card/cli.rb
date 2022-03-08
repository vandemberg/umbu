require_relative "bootstrap"

=begin
  - Um responsável pode gerar cartões para seus dependentes
  - Os usuários que possuem cartões são dependentes dos responsáveis.
  - Um responsável pode bloquear um cartão a qualquer momento
  - Eles também pode adicionar dinheiro a esses cartões

  Esse dinheiro adicionado tem que ter um proposito:
    1) Alimentação: Só em estabelecimentos do tipo alimetĩcio

    2) Sacar: Um valor que só pode ser usado para ser sacado

    3) Livre: Pode ser utilizado em qualuqer lugar, mas não pode ser sacado
=end

database = Configs::Database.start_connection

result = database.connection.query('show tables')

if result.size.zero?
  raise("Database empty")
end

if not ARGV[0].nil?
  Console::Command.execute_commands(ARGV[0])
else
  raise("command no found")
end
