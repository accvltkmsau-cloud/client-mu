class HUD.hudNotice extends core.KeyMovieClip
{
   var _keyName;
   var _normal;
   var _eventMap;
   var _LongMovement;
   var _LongMovementBG;
   var _devPosition = false;
   function hudNotice()
   {
      super();
      this._keyName = "hudNotice";
   }
   function devFunTest(devFunTest)
   {
      devFunTest.setUIName("HUD 공지");
      devFunTest.addFunInfo("addText","dddddd");
   }
   function onLoad()
   {
      Stage.addListener(this);
      this._normal.setIntervalTime(10000);
      this._eventMap.setIntervalTime(5000);
      this._LongMovement.setIntervalTime(2000);
      this._LongMovementBG = MovieClip(this._LongMovement)._LongMovementBG;
      this.onResize();
   }
   function onResize()
   {
      this._normal._x = Math.floor((Stage.width - this._normal._width) / 2);
      this._normal._y = Math.floor(Stage.height / 100 * 60);
      this._eventMap._x = Math.floor((Stage.width - this._eventMap._width) / 2);
      this._eventMap._y = 130;
      this._LongMovement._x = Math.floor((Stage.width - this._LongMovement._width) / 2);
      this._LongMovement._y = 150;
      if(this._devPosition == true)
      {
         this._eventMap._y += 100;
         this._normal._y -= 100;
      }
      if(Stage.width - this._LongMovementBG._width > 0)
      {
         this._LongMovementBG._xscale = Stage.width * this._LongMovementBG._xscale / this._LongMovementBG._width;
      }
   }
   function devOldUITest(b)
   {
      this._devPosition = b;
      this.onResize();
   }
   function addText(msg)
   {
      this._normal.addText(msg);
   }
   function clearTexts()
   {
      this._normal.clearTexts();
   }
   function addEventMapText(msg)
   {
      this._eventMap.addText(msg);
   }
   function clearEventMapText()
   {
      this._eventMap.clearTexts();
   }
   function addLongMovementText(textInfo)
   {
      this._LongMovement.setIntervalTime(textInfo.Duration);
      this._LongMovement._y = textInfo.YPos;
      this._LongMovement.clearTexts();
      this._LongMovement.addText(textInfo.Text);
   }
}
