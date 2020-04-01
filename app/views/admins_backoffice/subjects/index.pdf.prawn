prawn_document do |pdf|
  pdf.text "Listando áreas de conhecimento"
  pdf.move_down 20
  pdf.table @subjects.collect{|s| [s.id, s.description]}
end 