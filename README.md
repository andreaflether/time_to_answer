# Time To Answer

Projeto final do curso Ruby on Rails 5.x (Jackson Pires)

## Instalação
**1. Baixar repositório**
```
git clone blablabla
```

**2. Rodar bundle:**
```ruby
bundle install # or just bundle
```

**3. Executar task com dados iniciais (desenvolvimento)**
```ruby
rais dev:setup
``` 

**4. Rodar o console e em seguida realizar a adição dos índices:**
``` 
rails c
```
```ruby
Question.reindex
```

*Opcional: instalar Redis para verificar se as chaves foram corretamente cadastradas*
```
sudo apt-get install redis-server
```
*Todas as chaves devem aparecer após rodar o comando:*
```
redis-cli KEYS '*'
```
