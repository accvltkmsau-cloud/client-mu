class UIBase extends core.KeyMovieClip
{
   var _keyName;
   var _curScene;
   var _isInGameShop;
   var _stepText;
   var mcBottomHud;
   var _devText;
   var onEnterFrame;
   var mcTopLevel;
   var mcBottom;
   var mcData;
   var mcWindow;
   var mcBottomFrame;
   function UIBase()
   {
      super();
      this._keyName = "UIFrame";
      this._curScene = enum.GameScene.Non;
      this._isInGameShop = false;
      this._stepText = "";
      if(gSystem.isClient == true)
      {
         this.mcBottomHud.hitTestDisable = true;
      }
      if(this._devText != undefined)
      {
         this._devText._x = Stage.width - this._devText._width;
         this._devText._y = Stage.height - this._devText._height;
         this.onEnterFrame = this.onDevTextUpdate;
      }
      gSystem.setUIBase(this);
   }
   function onDevTextUpdate()
   {
      var _loc2_ = "curScene:" + this._curScene + ", " + this + "\n";
      _loc2_ += "mcTopLevel :" + this.mcTopLevel.getWaitArrayCount() + ", " + this.mcTopLevel.getMCArrayCount() + "\n";
      _loc2_ += "mcBottom :" + this.mcBottom.getWaitArrayCount() + ", " + this.mcBottom.getMCArrayCount() + "\n";
      _loc2_ += "mcData :" + this.mcData.getWaitArrayCount() + ", " + this.mcData.getMCArrayCount() + "\n";
      _loc2_ += "mcBottomHud :" + this.mcBottomHud.getWaitArrayCount() + ", " + this.mcBottomHud.getMCArrayCount() + "\n";
      _loc2_ += "-" + this._stepText + "\n";
      this._devText.text = _loc2_;
   }
   function setInGameShop(b)
   {
      this._isInGameShop = b;
      if(this._isInGameShop == true)
      {
         this.mcWindow.closeAll();
      }
      this.updateShowUI();
   }
   function IsMainScene()
   {
      return enum.GameScene.Main == this._curScene;
   }
   function changeScene(_scene)
   {
      this._curScene = _scene;
      this.updateShowUI();
   }
   function updateShowUI()
   {
      var _loc0_;
      if((_loc0_ = this._curScene) !== enum.GameScene.Main)
      {
         this.mcWindow.lockIgnoreCloseAll();
         this.mcWindow._visible = true;
         this.mcTopLevel._visible = false;
         this.mcBottom._visible = false;
         this.mcBottomFrame._visible = false;
         this.mcBottomHud._visible = false;
      }
      else if(this._isInGameShop == true)
      {
         this.mcBottomFrame._visible = true;
         this.mcTopLevel._visible = false;
         this.mcBottom._visible = false;
         this.mcBottomHud._visible = false;
         this.mcWindow._visible = false;
      }
      else
      {
         this.mcBottomFrame._visible = true;
         this.mcTopLevel._visible = true;
         this.mcBottom._visible = true;
         this.mcBottomHud._visible = true;
         this.mcWindow._visible = true;
      }
   }
   function onLoad()
   {
      debug.Log("onLoad UIFrame");
      Selection.disableFocusKeys = true;
      this.mcTopLevel.addEventListener("onLoadArray",this,"onLoadMovies");
      this.mcBottom.addEventListener("onLoadArray",this,"onLoadMovies");
      this.mcBottomFrame.addEventListener("onLoadArray",this,"onLoadMovies");
      this.mcData.addEventListener("onLoadArray",this,"onLoadMovies");
      this.mcBottomHud.addEventListener("onLoadArray",this,"onLoadMovies");
      if(gSystem.isClient == true)
      {
         this.mcData._visible = false;
         this.mcTopLevel._visible = false;
         this.mcBottom._visible = false;
         this.mcBottomFrame._visible = false;
         this.mcBottomHud._visible = false;
         this.mcWindow._visible = true;
      }
      else
      {
         trace("클라이언트가 아닙니다.");
      }
      this._stepText += "onLoad \n";
   }
   function onloadBottomHud(e)
   {
   }
   function onLoadMovies(e)
   {
      var _loc2_ = new Object();
      _loc2_.mcTopLevel = this.mcTopLevel.getWaitArrayCount();
      _loc2_.mcBottomFrame = this.mcBottomFrame.getWaitArrayCount();
      _loc2_.mcBottom = this.mcBottom.getWaitArrayCount();
      _loc2_.mcData = this.mcData.getWaitArrayCount();
      _loc2_.mcBottomHud = this.mcBottomHud.getWaitArrayCount();
      this.EventCall("onLoadWait",_loc2_);
      if(this.mcTopLevel.getWaitArrayCount() != 0)
      {
         return undefined;
      }
      if(this.mcBottomFrame.getWaitArrayCount() != 0)
      {
         return undefined;
      }
      if(this.mcBottom.getWaitArrayCount() != 0)
      {
         return undefined;
      }
      if(this.mcData.getWaitArrayCount() != 0)
      {
         return undefined;
      }
      if(this.mcBottomHud.getWaitArrayCount() != 0)
      {
         return undefined;
      }
      this.mcWindow.onFileLoad();
      this.EventCall("onFileLoad",{});
   }
   function onFileLoad()
   {
      this._stepText += "onFileLoad \n";
      super.onFileLoad();
      if(gSystem.isClient == true)
      {
         return undefined;
      }
      this.mcData.LoadArray(new Array("datas\\ImageData"));
      this.mcTopLevel.LoadArray(new Array("frame\\Tooltip","frame\\Popups"));
      this.mcBottomFrame.LoadArray(new Array("frame\\main","frame\\topmenu","frame\\AlarmFrame","frame\\bufflist"));
      this.mcBottom.LoadArray(new Array("frame\\ItemDurability","frame\\Chat","QJournal"));
      this.mcBottomHud.LoadArray(new Array("frame\\hudPlayerName","frame\\hudMap","frame\\hudNotice"));
   }
   function LoadFrameFiles(info)
   {
      this._stepText += "LoadFrameFiles \n";
      this._stepText += "info.mcData" + info.mcData + " " + Array(info.mcData).length + "\n";
      this._stepText += "info.mcTopLevel" + info.mcTopLevel + " " + Array(info.mcTopLevel).length + "\n";
      this._stepText += "info.mcBottomFrame" + info.mcBottomFrame + " " + Array(info.mcBottomFrame).length + "\n";
      this._stepText += "info.mcBottom" + info.mcBottom + " " + Array(info.mcBottom).length + "\n";
      this._stepText += "info.mcBottomHud" + info.mcBottomHud + " " + Array(info.mcBottomHud).length + "\n";
      this.mcData.LoadArray(info.mcData);
      this.mcTopLevel.LoadArray(info.mcTopLevel);
      this.mcBottomFrame.LoadArray(info.mcBottomFrame);
      this.mcBottom.LoadArray(info.mcBottom);
      this.mcBottomHud.LoadArray(info.mcBottomHud);
      this.EventCall("LoadFrameFiles",{});
   }
}
