class HUD.ToolTipManager extends MovieClip
{
   var topmostLevel;
   var _textToolTip;
   var _targetMC;
   var _mouseEventObj;
   var _manager;
   var _Dumy;
   var _curToolTip;
   var _targetPosInfo;
   var _LinkItem;
   function ToolTipManager()
   {
      super();
   }
   function onLoad()
   {
      this.topmostLevel = true;
      this._textToolTip.hitTestDisable = true;
      this._targetMC = undefined;
      this._mouseEventObj = new Object();
      this._mouseEventObj._manager = this;
      this._mouseEventObj.onMouseMove = function(mouseIdx, x, y)
      {
         if(this._manager._targetMC == undefined)
         {
            return undefined;
         }
         var _loc2_ = this._manager._targetMC;
         if(_loc2_.hitTest(x,y) == false)
         {
            this._manager.ClearTooltip();
         }
         else
         {
            this._manager.UpdatePos(this._manager._curToolTip);
         }
      };
      this._textToolTip._visible = false;
      if(this._Dumy != undefined)
      {
         this._Dumy.addEventListener("rollOver",this,"onTest");
         this._Dumy.addEventListener("click",this,"onTest2");
      }
      gSystem.Tooltip = this;
   }
   function onTest()
   {
      var _loc2_ = "테스트 툴팁. 첫라인<br>둘째라인";
      this.SetText(_loc2_,this._Dumy,"CT");
   }
   function onTest2()
   {
      this.SetItemLink({tooltip:"테스트 툴팁2. 첫라인<br>둘째라인",tooltipEx:"세트효과"});
   }
   function ClearTooltip()
   {
      this._textToolTip.Clear();
      this._targetMC = undefined;
      this._curToolTip = undefined;
      this._targetPosInfo = undefined;
      Mouse.removeListener(this._mouseEventObj);
   }
   function SetText(tooltipText, target, posInfo)
   {
      this._textToolTip.SetText(tooltipText);
      this._curToolTip = this._textToolTip;
      this._targetMC = target;
      this._targetPosInfo = posInfo;
      this.UpdatePos(this._curToolTip);
      Mouse.addListener(this._mouseEventObj);
   }
   function SetItemLink(data)
   {
      this._LinkItem.SetText(data);
      this.UpdatePos(this._LinkItem);
   }
   function setTargetGlobalPos(tooltipMC, in_x, in_y)
   {
      var _loc2_ = {x:in_x,y:in_y};
      this._targetMC.localToGlobal(_loc2_);
      tooltipMC._x = _loc2_.x;
      tooltipMC._y = _loc2_.y;
   }
   function UpdatePos(tooltipMC)
   {
      switch(this._targetPosInfo)
      {
         case "LT":
            this.setTargetGlobalPos(tooltipMC,0,- tooltipMC._height);
            break;
         case "CT":
            this.setTargetGlobalPos(tooltipMC,this._targetMC._width / 2,- tooltipMC._height);
            break;
         case "RT":
            this.setTargetGlobalPos(tooltipMC,this._targetMC._width,- tooltipMC._height);
            break;
         case "LB":
            this.setTargetGlobalPos(tooltipMC,0,this._targetMC._height);
            break;
         case "CB":
            this.setTargetGlobalPos(tooltipMC,this._targetMC._width / 2,this._targetMC._height);
            break;
         case "RB":
            this.setTargetGlobalPos(tooltipMC,this._targetMC._width,this._targetMC._height);
            break;
         default:
            tooltipMC._x = this._xmouse - tooltipMC._width;
            tooltipMC._y = this._ymouse - tooltipMC._height;
      }
      if(tooltipMC._x < 0)
      {
         tooltipMC._x = 0;
      }
      else if(tooltipMC._x + tooltipMC._width > Stage.width)
      {
         tooltipMC._x = Stage.width - tooltipMC._width;
      }
      if(tooltipMC._y < 0)
      {
         tooltipMC._y = 0;
      }
      else if(tooltipMC._y + tooltipMC._height > Stage.height)
      {
         tooltipMC._y = Stage.height - tooltipMC._height;
      }
   }
}
