class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show

    #  Parameters: {"path_id"=>"772"}
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)
  
    render({ :template => "photo_templates/show.html.erb"})
  end

  def delete
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy

    # render({ :template => "photo_templates/delete_photo.html.erb"})

    redirect_to("/photos")

  end

  def create

    # Parameters: {"query_image"=>"https://cdn.theatlantic.com/thumbor/XHnX01jsTr_7vAuV0-HUZg4tffo=/1500x1000/media/img/photo/2020/09/photos-week-1/a01_AP20267649678343/original.jpg", "query_caption"=>"supergirl", "query_owner_id"=>"117"}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render({ :template => "photo_templates/create.html.erb"})

    next_url = "/photos/" + a_new_photo.id.to_s
    redirect_to(next_url)

  end

  def update 
    #Parameters: {"query_image"=>"https://cdn.theatlantic.com/thumbor/QAVS7uZ4dzE1zhSSbO13HeEM9Qs=/1500x998/media/img/photo/2020/09/photos-week-1/a04_1228649507/original.jpg", "query_caption"=>"flowers updated", "modify_id"=>"952"}

    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

  # render({ :template => "photo_templates/update.html.erb"})

  next_url = "/photos/" + the_photo.id.to_s
  redirect_to(next_url)
  end

end