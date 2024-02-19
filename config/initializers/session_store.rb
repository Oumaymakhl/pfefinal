if rails.env=="production"
Rails.application.config.session_store :cookie_store, key: "_pfe", domain: "jdh-pfe-api.herokuapp.com"
else 
    Rails.application.config.session_store :cookie_store, key: "_pfe"
    end