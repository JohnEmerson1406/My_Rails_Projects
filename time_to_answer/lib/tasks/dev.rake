namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD") do
        # puts %x(rails db:drop db:create db:migrate db:seed)
        %x(rails db:drop)
      end

      show_spinner("Criando BD") do
        %x(rails db:create)
      end

      show_spinner("Migrando BD") do
        %x(rails db:migrate)
      end

      show_spinner("Cadastrando o admin padrão") do
        %x(rails dev:add_default_admin)
      end

      show_spinner("Cadastrando o user padrão") do
        %x(rails dev:add_default_user)
      end

      #pode ser assim tbm, quando é só uma linha:
      #show_spinner("Povoando BD") { %x(rails db:seed) }

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    # nesse caso, utiliza-se o create ao invés do
    # find_or_create_by pq o devise ja verifica se
    # há um admin com o mesmo email
    Admin.create!(
      email: 'admin@admin.com',
      password: 123456,
      password_confirmation: 123456
    )
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: 123456,
      password_confirmation: 123456
    )
  end

  private
  
  def show_spinner(msg_start, msg_end="Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
