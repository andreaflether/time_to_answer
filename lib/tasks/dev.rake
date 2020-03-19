namespace :dev do

  DEFAULT_ADMIN_PASSWORD = 'admin@123'
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "TODO"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop:_unsafe) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando outros administradores...") { %x(rails dev:add_extra_admins) }
      show_spinner("Cadastrando usuário padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando diversos assuntos...") { %x(rails dev:add_subjects) }
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona um administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_ADMIN_PASSWORD,
      password_confirmation: DEFAULT_ADMIN_PASSWORD
    )
  end

  desc "Adiciona administradores extas"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_ADMIN_PASSWORD,
        password_confirmation: DEFAULT_ADMIN_PASSWORD
      )
    end 
  end

  desc "Adiciona um usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: 'user@123',
      password_confirmation: 'user@123'
    )
  end

  desc "Adiciona assuntos padrão"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end
