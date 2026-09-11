class HUD.TooltipAsset.ItemToolTip extends MovieClip
{
   var _baseInfo;
   var _exInfo;
   var _btClose;
   function ItemToolTip()
   {
      super();
   }
   function onLoad()
   {
      this._visible = false;
      this._baseInfo.onPress = function()
      {
         this._parent.handleTitleDragStart();
      };
      this._baseInfo.onRelease = function()
      {
         this._parent.handleTitleDragStop();
      };
      this._exInfo.onPress = function()
      {
         this._parent.handleTitleDragStart();
      };
      this._exInfo.onRelease = function()
      {
         this._parent.handleTitleDragStop();
      };
      this._btClose.addEventListener("click",this,"Clear");
   }
   function handleTitleDragStart()
   {
      this.startDrag(false);
   }
   function handleTitleDragStop()
   {
      this.stopDrag();
   }
   function Clear()
   {
      this._visible = false;
   }
   function SetText(data)
   {
      this._baseInfo.SetText(data.tooltip);
      var _loc3_ = this._baseInfo._width;
      var _loc2_;
      if(data.tooltipEx != undefined)
      {
         this._exInfo._x = this._baseInfo._width;
         this._exInfo.SetText(data.tooltipEx);
         _loc3_ += this._exInfo._width;
         _loc2_ = Math.max(this._baseInfo._height,this._exInfo._height);
         this._baseInfo.setHeight(_loc2_);
         this._exInfo.setHeight(_loc2_);
      }
      this._btClose._x = _loc3_ - this._btClose._width - 3;
      this._btClose._y = 3;
      this._visible = true;
   }
}
