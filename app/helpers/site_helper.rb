module SiteHelper
  def jumbotron
    case params[:action]
    when 'index'
      %(<h1 class="jumbotron-heading">Qual o seu objetivo?</h1>
      <p class="lead text-muted">
      Monitore seu desempenho e sua evolução, marque áreas de conhecimento do seu interesse e controle seus estudos.
      Somos uma plataforma completa para tornar seus estudos mais simples!
      </p>)
    when 'questions'
      %(<h3 class="jumbotron-heading">Resultados da pesquisa</h3>
      <p class="lead text-muted">#{@questions.total_count} resultados encontrados para o termo 
      <b>"#{params[:term]}"</b></p>)
    when 'subject'
      %(<h3 class="jumbotron-heading">Filtrando questões por área: #{params[:subject]}</h3>
      <p class="lead text-muted mb-4">Exibindo #{@questions.count} do total de #{@questions.total_count} 
      questões encontradas</p>)
    end
  end  
end
