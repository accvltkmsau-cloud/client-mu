class HUD.TooltipAsset.TextTooltip extends MovieClip
{
   var _txt;
   var _bg;
   function TextTooltip()
   {
      super();
   }
   function onLoad()
   {
      this._visible = false;
      this._txt.textField.autoSize = "left";
      this._txt.textField.wordWrap = false;
      this._txt.hitTestDisable = true;
   }
   function SetText(text)
   {
      this._txt.htmlText = text;
      var _loc2_ = Math.ceil(this._txt._width);
      var _loc3_ = Math.ceil(this._txt._height);
      this._txt._width = _loc2_;
      this._txt._height = _loc3_;
      this._txt.width = _loc2_;
      this._txt.height = _loc3_;
      this._bg._width = this._txt._width + this._txt._x * 2;
      this._bg._height = this._txt._height + this._txt._y * 2;
      this._visible = true;
   }
   function Clear()
   {
      this._visible = false;
   }
   function setHeight(bgHeight)
   {
      this._bg._height = bgHeight;
   }
}
