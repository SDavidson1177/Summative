class Entity{

  PVector position;
  PVector size;
  PVector velocity;
  int speed;
  float orientation;
  //GIF STUFF

  Entity(PVector tposition, PVector tsize, PVector tvelocity, int tspeed, float torientation /* GIF STUFF*/) {
    position = tposition;
    size = tsize;
    velocity = tvelocity;
    speed = tspeed;
    orientation = torientation;
  }

 /* boolean collide(ArrayList<Entity> entities, PVector intendedMove) {// handles collisions
    for (int i = 0; i < entities.size(); i++) {
      if(entities.get()){
        return true;
      }
    }
    return false;
  }*/
  
  void display() {//default display method, should only be called when a child does not have its own yet or it encounters an error
    rect(position.x, position.y, size.x, size.y);
  }

  PVector collideEntity(ArrayList<Entity> entities) {//default collision code, does no predictive analysis, returns the direction the entity should move to be push out of the other entity
    for ( int i = 0; i < entities.size(); i ++) {
      if (position.x + size.x/2 >= entities.get(i).position.x - entities.get(i).size.x && position.x - size.x/2 <= entities.get(i).position.x + entities.get(i).size.x/2 && position.y + size.y/2 >= entities.get(i).position.y - entities.get(i).size.y/2 && position.y - size.y/2 <= entities.get(i).position.y + entities.get(i).size.y/2) {
        float angle = atan2(  entities.get(i).position.y - position.y, entities.get(i).position.x - position.x )  * 180 / PI;
        return  new PVector(cos( angle * PI / 180 ) , sin( angle * PI / 180 ) );
      }
    }
    return new PVector(0,0);
  }
  
  void move(){//moves the entity based on its directional velocity and time since last call
   position.x += velocity.x/* * time since last call*/;
   position.y += velocity.y/* * time since last call*/;
  }
  
}