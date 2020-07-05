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

      #pode ser assim tbm, quando é só uma linha:
      show_spinner("Povoando BD") { %x(rails db:seed) }

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  private
  
  def show_spinner(msg_start, msg_end="Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
