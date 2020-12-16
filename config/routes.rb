Rails.application.routes.draw do

  # HOMEPAGE

  get("/", { :controller => "brackets", :action => "index"})

  # Routes for the Entry resource:

  # CREATE
  post("/insert_entry", { :controller => "entries", :action => "create" })
          
  # READ
  get("/entries", { :controller => "entries", :action => "index" })
  
  get("/entries/:path_id", { :controller => "entries", :action => "show" })
  
  # UPDATE
  
  post("/modify_entry/:path_id", { :controller => "entries", :action => "update" })
  
  # DELETE
  get("/delete_entry/:path_id", { :controller => "entries", :action => "destroy" })

  #------------------------------

  # Routes for the Bracket resource:

  # CREATE
  post("/insert_bracket", { :controller => "brackets", :action => "create" })
          
  # READ
  get("/brackets", { :controller => "brackets", :action => "index" })
  
  get("/brackets/:path_id", { :controller => "brackets", :action => "show" })
  
  # UPDATE
  
  post("/modify_bracket/:path_id", { :controller => "brackets", :action => "update" })
  
  # DELETE
  get("/delete_bracket/:path_id", { :controller => "brackets", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
