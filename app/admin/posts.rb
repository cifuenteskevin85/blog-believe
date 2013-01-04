ActiveAdmin.register Post do
  filter :title, label: "por Titulo"
  filter :created_at, label: "por Fecha de creacion"

  form html: {enctype: "multipart/form-data"} do |f|
    f.inputs "Post", multipart: true do
      f.input :title, label: "Titulo"
      f.input :body, label: "Contenido"
    end
  end

  index do
    column "Titulo", :title
    column "Contenido", :body
    column "Fecha de creacion", :created_at
    default_actions
  end
end
