Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})


  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})
  get("/delete_photo/:toast_id", { :controller => "photos", :action => "delete"})
  get("/insert_photo", { :controller => "photos", :action => "create"})

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})
  get("/insert_comment_record/:modify_id", { :controller => "photos", :action => "new_comment"})

  get("/insert_user_record", { :controller => "users", :action => "create"})

end
