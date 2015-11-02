package
{
  /**
   * ...
   * @author wojciech[at]sierakowski.eu
   */
  import PathFinder;
  import flash.display.Sprite;
  import flash.text.TextField;
 
  public class Pathfinding extends Sprite
  {
    var map:Array;
    public static var MAP_ELEMENT_SIZE  :int = 20;
 
    var mapSpriteBefore:Sprite, mapSpriteAfter:Sprite;
 
    public function Pathfinding()
    {
      //create a map
      map = new Array();
      map[0] = "X X X X X X X X X X".split(" ");
      map[1] = "X S _ _ X X _ X _ X".split(" ");
      map[2] = "X _ X _ _ X _ _ _ X".split(" ");
      map[3] = "X _ X X _ _ _ X _ X".split(" ");
      map[4] = "X _ X _ _ X _ _ _ X".split(" ");
      map[5] = "X _ _ _ X X _ X _ X".split(" ");
      map[6] = "X _ X _ _ X _ X _ X".split(" ");
      map[7] = "X _ X X _ _ _ X _ X".split(" ");
      map[8] = "X _ _ 0 _ X _ _ _ X".split(" ");
      map[9] = "X X X X X X X X X X".split(" ");
 
     // mapSpriteBefore = createVisualMap(map);
     // addChild(mapSpriteBefore);
 
      var paths:Array = PathFinder.findPath(map);
      mapSpriteAfter = createVisualMap(map, paths);
     // mapSpriteAfter.x = MAP_ELEMENT_SIZE * 11;
      addChild(mapSpriteAfter);
    }
 
    public function createVisualMap(mapArray:Array, paths:Array = null):Sprite
    {
      var i:int;
 
      var mapSprite:Sprite = new Sprite();
      for (i = 0; i < mapArray.length; i++)
      {
        for (var j:int = 0; j < mapArray[i].length; j++)
        {
          var mapElement:Sprite = new Sprite();
          switch (mapArray[i][j])
          {
            case PathFinder.MAP_WALL:
              mapElement.graphics.beginFill(0x000000);
              mapElement.graphics.drawRect(0, 0, MAP_ELEMENT_SIZE, MAP_ELEMENT_SIZE);
              mapElement.graphics.endFill();
              break;
            case PathFinder.MAP_OPEN_SPACE:
              mapElement.graphics.beginFill(0xFFFFFF);
              mapElement.graphics.drawRect(0, 0, MAP_ELEMENT_SIZE, MAP_ELEMENT_SIZE);
              mapElement.graphics.endFill();
              break;
            case PathFinder.MAP_START:
              mapElement.graphics.beginFill(0x00FFFF);
              mapElement.graphics.drawRect(0, 0, MAP_ELEMENT_SIZE, MAP_ELEMENT_SIZE);
              mapElement.graphics.endFill();
              break;
            case PathFinder.MAP_FINISH:
              mapElement.graphics.beginFill(0xFF0000, .5);
              mapElement.graphics.drawRect(0, 0, MAP_ELEMENT_SIZE, MAP_ELEMENT_SIZE);
              mapElement.graphics.endFill();
              break;
          }
          mapElement.x = j * MAP_ELEMENT_SIZE;
          mapElement.y = i * MAP_ELEMENT_SIZE;
          mapSprite.addChild(mapElement);
        }
      }
 
      if (paths != null)
      {
		 /*
        for (i = 1; i < paths.length; i++)
        {
		  var mapElement2:Sprite = new Sprite();
		  mapElement2.graphics.beginFill(0x0FF000, .5);
          mapElement2.graphics.drawRect(0, 0, MAP_ELEMENT_SIZE, MAP_ELEMENT_SIZE);
          mapElement2.graphics.endFill();
          //var label_txt:TextField = new TextField();
          //label_txt.text = paths[i].counter;
          mapElement2.x = paths[i].j * MAP_ELEMENT_SIZE;
          mapElement2.y = paths[i].i * MAP_ELEMENT_SIZE;
		  mapSprite.addChild(mapElement2);
          //mapSprite.addChild(label_txt);
        }*/
		 for (i = 0; i < paths.length; i++)
        {
          var label_txt:TextField = new TextField();
          label_txt.text = paths[i].counter;
          label_txt.x = paths[i].j * MAP_ELEMENT_SIZE;
          label_txt.y = paths[i].i * MAP_ELEMENT_SIZE;
          mapSprite.addChild(label_txt);
        }
      }
      return mapSprite;
    }
  }
}