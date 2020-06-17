# Time To Answer

Projeto final do curso [Ruby on Rails 5.x (Jackson Pires).](https://www.udemy.com/course/rubyonrails-5x/)

## Instalação
**1. Baixar repositório**
```
git clone https://github.com/andreaflether/time_to_answer.git
```

**2. Rodar bundle:**
```ruby
bundle install # or just bundle
```
**3. Instalar Redis:**
```
sudo apt-get install redis-server
```
Opcional: a conexão pode ser verificada com o comando `redis-cli ping`. O retorno `PONG` significa que a mesma foi bem sucedida.

**4. Executar task com dados iniciais (desenvolvimento)**
```ruby
rais dev:setup
``` 

**5. Todas as chaves adicionadas na task devem aparecer após rodar o comando:**
```
redis-cli KEYS '*'
```

**6. Iniciar serviço do elasticsearch. Antes, verifique o output do comando `ps -p 1`.**
- **systemd:** `sudo systemctl start elasticsearch.service`
- **init:** `sudo -i service elasticsearch start`

**7. Rodar o console e em seguida realizar a adição dos índices:**
``` 
rails c
```
```ruby
Question.reindex
```

