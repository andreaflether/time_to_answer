require 'net/http'
class CEP
  attr_reader :logradouro, :bairro, :localidade, :uf
  END_POINT = "https://viacep.com.br/ws/"
  FORMAT = "json"
  
  def initialize(cep)
    resultado = encontrar(cep) # Hash
    preencher_dados(resultado)
  end 

  def endereco 
    "#{@logradouro}, #{@bairro} - #{@localidade}/#{@uf}"
  end 

  private 

  def preencher_dados(resultado)
    @logradouro = resultado["logradouro"]
    @bairro     = resultado["bairro"]
    @localidade = resultado["localidade"]
    @uf         = resultado["uf"]
  end 

  def encontrar(cep)
    ActiveSupport::JSON.decode(
      Net::HTTP.get(
        URI("#{END_POINT}#{cep}/#{FORMAT}/")
      )
    )
  end 
end 