class common.Popups extends core.KeyMovieClip
{
   var _keyName;
   var _arrDatas;
   var _container;
   var _DevText;
   var _common;
   var _hitBG;
   var _curPopup;
   var _curData;
   function Popups()
   {
      super();
      this._keyName = "popup";
      this._arrDatas = new Array();
      this._container = this.createEmptyMovieClip("container",this.getNextHighestDepth());
   }
   function onLoad()
   {
      if(gSystem.isClient == true)
      {
         if(this._DevText != undefined)
         {
            this._DevText._visible = false;
         }
      }
      Stage.addListener(this);
      this._common.addEventListener("close",this,"onClosePopup");
      this._common.addEventListener("open",this,"onOpenPopup");
      this._common._visible = false;
      this._hitBG._visible = false;
      this.onResize();
      gSystem.Popup = this;
   }
   function setText(info)
   {
      this._common.setText(info);
   }
   function onResize()
   {
      trace("Popups onResize");
      this._hitBG._width = Stage.width;
      this._hitBG._height = Stage.height;
   }
   function devFunTest(devFunTest)
   {
      devFunTest.setUIName("팝업시스템");
      devFunTest.addFunInfo("onTestPopup1");
   }
   function onTestPopup1(e)
   {
      switch(util.random(0,3))
      {
         case 0:
            this.addTestPopup(common.PopupMc.PopupInfo.Ok);
            break;
         case 1:
            this.addTestPopup(common.PopupMc.PopupInfo.YesNo);
            break;
         case 2:
            this.addTestPopup(common.PopupMc.PopupInfo.OkCancel);
      }
   }
   function addTestPopup(popupType)
   {
      var _loc2_ = new common.PopupMc.PopupInfo();
      _loc2_.type = popupType;
      this.addPopup(_loc2_);
   }
   function addPopup(info)
   {
      this._arrDatas.push(info);
      this.createPopup();
   }
   function setDevText()
   {
      this._DevText.text = "count:" + this._arrDatas.length + "\n curPopup:" + this._curPopup._name + "\n type:" + this._curData.type;
   }
   function createPopup()
   {
      if(this._arrDatas.length <= 0)
      {
         this.setDevText();
         return undefined;
      }
      if(this._curPopup != undefined)
      {
         this.setDevText();
         return undefined;
      }
      var _loc2_ = this._container.getNextHighestDepth();
      var _loc3_;
      this._curData = this._arrDatas[0];
      this._arrDatas.shift();
      switch(this._curData.type)
      {
         case common.PopupMc.PopupInfo.Ok:
         case common.PopupMc.PopupInfo.YesNo:
         case common.PopupMc.PopupInfo.OkCancel:
            this._curPopup = this._common;
            this._curPopup.setData(this._curData);
            this.setDevText();
         default:
            trace("정의되지 않은 팝업 정보 " + this._curData.type);
            this._curData = undefined;
            this.setDevText();
            return undefined;
      }
   }
   function clearPopup()
   {
      this._curPopup = undefined;
      this._curData = undefined;
      this._hitBG._visible = false;
   }
   function onOpenPopup(e)
   {
      trace("--onOpenPopup -- ");
      this._hitBG._visible = true;
   }
   function onClosePopup(e)
   {
      trace("--onClosePopup -- ");
      util.TraceAllObjectInfo(e);
      var _loc2_ = e.data;
      if(_loc2_.callbackMovie != undefined && _loc2_.callbackFunName != undefined)
      {
         _loc2_.callbackMovie[_loc2_.callbackFunName](_loc2_);
      }
      this.clearPopup();
      this.createPopup();
   }
}
