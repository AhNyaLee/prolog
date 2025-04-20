
friend(bill,jane):- 
  girl(jane), 
  likes(bill,jane).

friend(bill,jim):- 
  likes(jim,baseball).
  
friend(bill,sue):- 
  girl(sue). 

girl(mary). 
girl(jane). 
girl(sue). 

likes(jim,baseball). 
likes(bill,sue).