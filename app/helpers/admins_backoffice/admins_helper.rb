module AdminsBackoffice::AdminsHelper

  def translate(object = nil, method = nil)
    (object && method) ? object.model.human_attribute_name(method) : "Tradução não localizada"
  end 

end
