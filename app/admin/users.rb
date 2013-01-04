ActiveAdmin.register User do
  index do
    column "Avatar" do |av|
      link_to image_tag("/assets/avatars/#{av.id}/thumb/#{av.avatar_file_name}",
                          alt: "#{av.full_name}"), admin_user_path(av)
    end
    column "Nombre", :full_name
    column "Email", :email
    default_actions
  end
end
