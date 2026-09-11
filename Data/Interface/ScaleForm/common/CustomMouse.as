class common.CustomMouse extends MovieClip
{
   var hitTestDisable;
   var topmostLevel;
   var _objMousePram;
   var noAdvance;
   var Cursor_M;
   var cursorType = -1;
   function CustomMouse()
   {
      super();
      this.hitTestDisable = true;
      this.topmostLevel = true;
      this._objMousePram = {setCursorType:Mouse.setCursorType,show:Mouse.show,hide:Mouse.hide};
      gSystem.mcMouse = this;
      this.useCustomMouse(gSystem.useCustomMouse);
   }
   function useCustomMouse(b)
   {
      debug.Log("커스텀 마우스  : " + b);
      if(b == false)
      {
         Mouse.setCursorType = this._objMousePram.setCursorType;
         Mouse.show = this._objMousePram.show;
         Mouse.hide = this._objMousePram.hide;
         this.noAdvance = true;
         this._visible = false;
         Mouse.show();
         Mouse.removeListener(this);
         return undefined;
      }
      this.noAdvance = false;
      this._visible = true;
      Mouse.addListener(this);
      Mouse.hide();
      Mouse.setCursorType = this.setCursorType;
      Mouse.show = function()
      {
         this.Cursor_M._visible = true;
      };
      Mouse.hide = function()
      {
         this.Cursor_M._visible = false;
      };
   }
   function onMouseMove()
   {
      this.Cursor_M._x = this._xmouse;
      this.Cursor_M._y = this._ymouse;
   }
   function setCursorType(mousetype, mouseIndex)
   {
      var _loc1_ = gSystem.mcMouse;
      if(_loc1_.cursorType == mousetype)
      {
         return undefined;
      }
      _loc1_.cursorType = mousetype;
      switch(mousetype)
      {
         case Mouse.ARROW:
            _loc1_.Cursor_M.Cursor.gotoAndStop("arrow");
            break;
         case Mouse.HAND:
            _loc1_.Cursor_M.Cursor.gotoAndStop("hand");
            break;
         case Mouse.IBEAM:
            _loc1_.Cursor_M.Cursor.gotoAndStop("ibeam");
      }
   }
}
