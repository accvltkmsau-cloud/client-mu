class common.WindowManager extends core.KeyMovieClip
{
   var _keyName;
   var _KeyMovies;
   var _win;
   var _devText;
   var onEnterFrame;
   function WindowManager()
   {
      super();
      this._keyName = "winMan";
   }
   function devFunTest(devFunTest)
   {
      devFunTest.setUIName("윈도우관리");
      devFunTest.addFunInfo("openWindow",{key:"QuestSummary",isOpen:false});
      devFunTest.addFunInfo("loadWindow","winTest");
      devFunTest.addFunInfo("unloadWindow","winTest");
      devFunTest.addFunInfo("closeAll","");
   }
   function onLoad()
   {
      this._KeyMovies = new Object();
      gSystem.WinMan = this;
      this._win.addEventListener("load",this,"onLoaderEvent");
      this._win.addEventListener("unload",this,"onLoaderEvent");
      this._win.addEventListener("onLoadArray",this,"onLoaderEvent");
      if(this._devText != undefined)
      {
         this.onEnterFrame = this.updateDevText;
      }
   }
   function onFileLoad()
   {
      super.onFileLoad();
      if(gSystem.isClient == true)
      {
         return undefined;
      }
      this._win.LoadArray(new Array("winOption","winParty","winPet","winQuestSummary","winSystemMenu"));
   }
   function addLoadWindows(arrWindows)
   {
      this._win.LoadArray(arrWindows);
   }
   function openWindow(info)
   {
      var _loc2_ = info.key;
      var _loc3_ = info.isOpen;
      if(this._KeyMovies[_loc2_] == undefined)
      {
         return undefined;
      }
      if(_loc3_ == true)
      {
         this._KeyMovies[_loc2_].openWindow();
      }
      else
      {
         this._KeyMovies[_loc2_].closeWindow();
      }
   }
   function closeAll()
   {
      for(var _loc2_ in this._KeyMovies)
      {
         if(this._KeyMovies[_loc2_].isKeyWindow == true && this._KeyMovies[_loc2_].isCloseLock == false)
         {
            this._KeyMovies[_loc2_].closeWindow();
         }
      }
   }
   function lockIgnoreCloseAll()
   {
      for(var _loc2_ in this._KeyMovies)
      {
         if(this._KeyMovies[_loc2_].isKeyWindow == true)
         {
            this._KeyMovies[_loc2_].closeWindow();
         }
      }
   }
   function getWindowMovie(memberName)
   {
      return this._KeyMovies[memberName];
   }
   function IsOpenWindow(memberName)
   {
      if(this._KeyMovies[memberName]._visible == true)
      {
         return true;
      }
      return false;
   }
   function setTopDepth(key)
   {
      var _loc2_ = this._win.getTopDepthMC();
      if(_loc2_.keyName == key)
      {
         return undefined;
      }
      this._win.setTopDepthMC(key);
   }
   function loadWindow(path)
   {
      var _loc2_ = this._win.getMCFileName(path);
      if(_loc2_ == undefined)
      {
         this._win.Load(path);
      }
   }
   function unloadWindow(key)
   {
      this._win.Unload(key);
   }
   function onLoaderEvent(e)
   {
      switch(e.type)
      {
         case "onLoadArray":
            if(e.count < 1)
            {
               debug.Log("winMan.onLoadAll");
            }
            break;
         case "load":
            this.addKeyWindow(e.keyMovie);
            break;
         default:
            trace("winManLoaderEvent : " + e.type);
      }
   }
   function addKeyWindow(mc)
   {
      if(mc == undefined)
      {
         return undefined;
      }
      if(mc.getKeyName == undefined)
      {
         return undefined;
      }
      var _loc2_ = mc.getKeyName();
      if(_loc2_ == undefined || _loc2_ == "")
      {
         return undefined;
      }
      debug.Log("winManEvent load : " + _loc2_ + ", " + mc);
      this._KeyMovies[_loc2_] = mc;
   }
   function delKeyWindow(keyName)
   {
      if(this._KeyMovies[keyName] == undefined)
      {
         return undefined;
      }
      this._KeyMovies[keyName] = undefined;
   }
   function updateDevText()
   {
      var _loc2_ = "winMan " + this._KeyMovies + "\n";
      for(var _loc3_ in this._KeyMovies)
      {
         if(this._KeyMovies[_loc3_] != undefined)
         {
            _loc2_ += _loc3_ + " : " + this._KeyMovies[_loc3_] + "\n";
         }
      }
      this._devText.text = _loc2_;
   }
}
