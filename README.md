# strategic_design_partner_in_rails

== README

== INSTRUCTION

Things you need to know for this application :

* ruby version 2.2.5
  rvm use ruby-2.2.5

* rails version 4.2.4

* install postgress

* bundle install (to install required gem)

* rails s ( to start server)
* run specs use command
  rspec spec
  * run controllers specs use command
    rspec spec/controllers
* api end points
   * GET /api/v1/cars/:car_slug?track=xyz  (pass valid csv)
     * Request Type GET
     
     * Different Response 
       {
            "car": {
                "id": 1,
                "name": "subaru_impreza",
                "max_speed": "280.0km/h",
                "slug": "subaru_impreza",
                "max_speed_on_track": "215.6km/h"
            }
        }
        - if car not found
           {
                "car": {
                    "staus": "Car Not Found"
                }
            }  
        - if track not found
            {
            "car": {
                "id": 1,
                "name": "subaru_impreza",
                "max_speed": "280.0km/h",
                "slug": "subaru_impreza",
                "max_speed_on_track": "Track Not Found"
                }
            }
            
         - if track param not  passed
            {
            "car": {
                "id": 1,
                "name": "subaru_impreza",
                "max_speed": "280.0km/h",
                "slug": "subaru_impreza",
                "max_speed_on_track": "Track Not Selected"
                }
            }   
   
 * File we have 
    - controller
      - api
        - v1
          - cars_controller.rb (we dont have any business logic in controller all the logic is moved to service layer)
     - services
         - car_info.rb
             this contain all the business logic for getting car details
         - tracks
           - track_detail
             this is the base call for all track class which contain common code
           - nurburgring
             - this is the first track class which got inherited from track_detail class.
             - You can add logic that are releated only to this track like other parameters like season, track, time etc                      without affecting other track class. 
           - baja
             - this is the second track class which got inherited from track_detail class.
             - You can add logic that are releated only to this track like other parameters like season, track, time etc
               without affecting other track class. 
           - suzuka_circuit
             - this is the third track class which got inherited from track_detail class
             - You can add logic that are releated only to this track like other parameters like season, track, time etc
               without affecting other track class. 
