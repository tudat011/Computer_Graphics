#include "colors.inc"
#include "shapes.inc"
#include "skies.inc"

#declare clock_1 = (clock)/0.5;
#declare speed = 2;
#if (clock<=0.5) 
    #declare s_z = clock_1*speed;  
#else
    #declare s_z = speed;    
#end

#declare clock_2 = (clock)/0.5;
#declare speed1 = 2;
#if (clock<=0.5) 
    #declare s_x = clock_2*speed1;  
#else
    #declare s_x = speed1;    
#end

#declare clock_3 = (clock)/0.5;
#declare speed2 = 1;
#if (clock<=0.5) 
    #declare s_y = clock_3*speed2;  
#else
    #declare s_y = speed2;    
#end


#declare move_start = 0;
#declare move_end = 0.5;
#declare move_clock = (clock-move_start)/(move_end-move_start);


#if  (clock>=move_start)
    #if (clock<move_end)
        #declare ball_z = move_clock * speed;
        #declare ball_x = move_clock * speed1;
        #declare ball_y = move_clock * speed2;
        #declare ball_r = move_clock * 360*10;
    #else
        #declare ball_z = speed;
        #declare ball_x = speed1;
        #declare ball_y = speed2;
        #declare ball_r = 0;
    #end
#end

#declare fall_start = 0.5;
#declare fall_end = 0.7;
#declare fall_clock = (clock-fall_start)/(fall_end-fall_start);


#if  (clock>=fall_start)
    #if (clock<fall_end)
        #declare ball_z = speed;
        #declare ball_x = speed1;
        #declare ball_y = (1 - fall_clock) * speed2;
        #declare ball_r = 0;
    #else
        #declare ball_z = speed;
        #declare ball_x = speed1;
        #declare ball_y = 0;
        #declare ball_r = 0;
    #end
#end

#declare show_start = 0.5;
#declare show_end = 1;
#declare show_clock = (clock-show_start)/(show_end-show_start);


#if  (clock>=show_start)
    #if (clock<show_end)
        box{
   <-5,5.3,10> <-.5,6,10>
   texture{
       pigment
{ image_map
  { jpeg "green.jpg"
    map_type 1    }
        }
    }
} 

text{
    ttf "roboto-bold.ttf",
    "GOOAAALLLLL!!!!!", 1, x*-0.03
    pigment{ 
    color Red
    scale 0.1 }
    finish{
        phong 1
        ambient 0.2
    }
    scale<1,1.1,0.01>*0.5
    translate<-4.5,5.4,9.5>
}


    #end
#end 

#declare score = 0;
#if (clock >= show_start)
    #declare score = 1;
#end

box{
   <-10.5,5.3,10> <-7.5,6,10>
   texture{
       pigment
{ image_map
  { jpeg "green.jpg"
    map_type 1    }
        }
    }
}

text{
    ttf "roboto-bold.ttf",
    concat(str(score,1,0) ,  " - 0"), 1, x*-0.03
    pigment{ 
    color White
    scale 0.1 }
    finish{
        phong 1
        ambient 5
    }
    scale<1,1.1,0.01>*0.5
    translate<-9.3,5.4,9.5>
}

camera{
    location <0,0.5,-7>
    look_at<0,-0.4,0>
}                 

light_source {<100, 1000, -50> color White parallel}

box{
   <0,0,0> <1,0.3,1> 
   texture{
       pigment {
           image_map{jpeg "grass.jpg"}
           scale <1,1,1>*0.1
       }
   }      
   scale<200,200,1>
   rotate<90,0,0>                
   translate <-50,0,-50>                 
}

box{
   <-12,0,10> <12,5,10>
   texture{
       pigment
{ image_map
  { jpeg "crowd.jpg"
    map_type 1    }
        }
    }
}


 

sky_sphere {
    S_Cloud5
} 

object {
    Sphere
    texture{
       pigment {
           image_map{jpeg "soccer.jpg"
           }
           scale <1,1,1>*5
       }
    }
    finish {phong 1}              
    scale<0.2,0.2,0.2>
    rotate <0, 0, ball_r>
    translate<0+ball_x, 0.2+ball_y,-5+ball_z>
}   

merge{
    cylinder{
    <0,0,0>, <0,2,0>, 0.03
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
    cylinder{
    <2,0,0>, <2,2,0>, 0.03
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
    cylinder{
    <0,2,0>, <2,2,0>, 0.05
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
    cylinder{
    <0.2,1.8,0>, <0.3,0.2,0>, 0.02
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
     cylinder{
    <1.7,0.2,0>, <1.8,1.8,0>, 0.02
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            } 
     cylinder{
    <0.2,1.8,0>, <0,2,0>, 0.02
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
     cylinder{
    <1.8,1.8,0>, <2,2,0>, 0.02
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
      cylinder{
    <0.2,1.8,0>, <1.8,1.8,0>, 0.01
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
      cylinder{
    <0,0,0>, <0.3,0.2,0>, 0.02
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
      cylinder{
    <2,0,0>, <1.7,0.2,0>, 0.02
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }
      cylinder{
    <0.3,0.2,0>, <1.7,0.2,0>, 0.01
    texture{
        pigment{
            rgb<1,1,1>*0.8
            }
            }
            }      
#macro Raster(RScale, RLine)
pigment{
   gradient x scale RScale
   color_map{[0.000   color rgbt<0,0,0,0>]
             [0+RLine color rgbt<0,0,0,0>]
             [0+RLine color rgbt<1,1,1,1>]
             [1-RLine color rgbt<1,1,1,1>]
             [1-RLine color rgbt<255,200,200,0>]
             [1.000   color rgbt<0,0,0,0>]
            }}
 finish {diffuse 0.9}
#end// of Raster(RScale, RLine)-macro
//-----------------------------------------
#macro ClearGrid (Rscale )
texture{Raster(1.00,0.04) rotate<0 ,45,0>
        scale Rscale rotate<90,0,0>}
texture{Raster(1.00,0.04) rotate<0,-45,0>
        scale Rscale rotate<90,0,0>}
#end //
//-----------------------------------------
box {<0,0,0>,<2,1.99,0.001>
     ClearGrid (0.2)}
     scale<2,1.1,0>
    
     
} 

text{
    ttf "roboto-bold.ttf",
    "18520589", 1, x*-0.03
    pigment{ 
    color Black
    scale 0.1 }
    finish{
        phong 1
        ambient 0.2
    }
    scale<1,1,0.01>*0.5
    translate<2,2.5,0>
}                    


  