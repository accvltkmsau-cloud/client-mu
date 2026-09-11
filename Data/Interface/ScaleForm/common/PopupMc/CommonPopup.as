class common.PopupMc.CommonPopup extends common.PopupMc.BasePopup
{
   var _btOk;
   var _btYesNo;
   var _btOkCancel;
   var _title;
   var _msg;
   function CommonPopup()
   {
      super();
   }
   function onLoad()
   {
      this.setUpButton(this._btOk,"Ok");
      this.setUpButton(this._btYesNo,"Yes");
      this.setUpButton(this._btYesNo,"No");
      this.setUpButton(this._btOkCancel,"Ok");
      this.setUpButton(this._btOkCancel,"Cancel");
   }
   function setText(info)
   {
      this.setUpText(this._btOk,"Ok",info);
      this.setUpText(this._btYesNo,"Yes",info);
      this.setUpText(this._btYesNo,"No",info);
      this.setUpText(this._btOkCancel,"Ok",info);
      this.setUpText(this._btOkCancel,"Cancel",info);
   }
   function setUpText(mc, buttonKey, info)
   {
      var _loc1_ = mc["bt" + buttonKey];
      if(_loc1_ == undefined)
      {
         trace("CommonPopup setUpText 실패 " + buttonKey);
         return undefined;
      }
      if(info[buttonKey] != undefined)
      {
         _loc1_.label = info[buttonKey];
      }
   }
   function setUpButton(mc, buttonKey)
   {
      var _loc2_ = mc["bt" + buttonKey];
      if(_loc2_ == undefined)
      {
         trace("CommonPopup 버튼세팅 실패 " + buttonKey);
         return undefined;
      }
      _loc2_.data = buttonKey;
      _loc2_.addEventListener("click",this,"onResultPopup");
   }
   function onResultPopup(e)
   {
      this.close(String(e.comp.data));
   }
   function setData(info)
   {
      this._title.text = info.datas.title;
      this._msg.text = info.datas.msg;
      this._btOk._visible = false;
      this._btYesNo._visible = false;
      this._btOkCancel._visible = false;
      switch(info.type)
      {
         case common.PopupMc.PopupInfo.Ok:
            this._btOk._visible = true;
            break;
         case common.PopupMc.PopupInfo.YesNo:
            this._btYesNo._visible = true;
            break;
         case common.PopupMc.PopupInfo.OkCancel:
            this._btOkCancel._visible = true;
      }
      super.setData(info);
   }
   function open()
   {
      this._x = Math.floor((Stage.width - this._width) / 2);
      this._y = Math.floor((Stage.height - this._width) / 2);
      if(caurina.transitions.Tweener.isTweening(this) == true)
      {
         caurina.transitions.Tweener.removeTweens(this);
      }
      this._alpha = 0;
      this._visible = true;
      caurina.transitions.Tweener.addTween(this,{_alpha:100,transition:"linear",time:0.1});
      super.open();
   }
}
