class core.MovieLoader extends MovieClip
{
   var _arrMC;
   var dispatchEvent;
   var _arrLoadWaitMC;
   var _loader;
   var _loadCount = 0;
   function MovieLoader()
   {
      super();
      gfx.events.EventDispatcher.initialize(this);
      this._arrMC = new Array();
      this._loadCount = 0;
   }
   function devFunTest(devFunTest)
   {
      devFunTest.setUIName("파일로더");
      devFunTest.addFunInfo("Load","box");
      devFunTest.addFunInfo("Unload","box");
   }
   function get IsMovieLoader()
   {
      return true;
   }
   function dispatchEventAndSound(event)
   {
      event.comp = this;
      this.dispatchEvent(event);
   }
   function onLoad()
   {
   }
   function onUnload()
   {
      this._arrMC.splice(0);
      this._arrMC = undefined;
   }
   function LoadArray(arrFileNames)
   {
      this._arrLoadWaitMC = arrFileNames;
      this.NextWaitMovieLoad();
   }
   function NextWaitMovieLoad()
   {
      if(this._arrLoadWaitMC.length < 1)
      {
         return undefined;
      }
      this.Load(this._arrLoadWaitMC[0]);
   }
   function onLoadMovieOne(targetfileName)
   {
      var _loc5_ = this.getMCFileName(targetfileName);
      _loc5_.isOnLoad = true;
      if(this._arrLoadWaitMC == undefined)
      {
         return undefined;
      }
      var _loc7_ = this._arrLoadWaitMC.length;
      if(isNaN(_loc7_) == true || _loc7_ == undefined)
      {
         return undefined;
      }
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc7_)
      {
         _loc3_ = this._arrLoadWaitMC[_loc2_];
         if(_loc3_ == targetfileName)
         {
            this._arrLoadWaitMC.splice(_loc2_,1);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.dispatchEventAndSound({type:"onLoadArray",name:this._name,count:this._arrLoadWaitMC.length});
      this.NextWaitMovieLoad();
   }
   function getWaitArrayCount()
   {
      return this._arrLoadWaitMC.length;
   }
   function getMCArrayCount()
   {
      return this._arrMC.length;
   }
   function Load(fileName)
   {
      var _loc7_ = this.getMCFileName(fileName);
      if(_loc7_ != undefined)
      {
         debug.Log("이미 로딩되어 있는 무비 " + keyName);
         util.TraceAllObjectInfo(_loc7_);
         return _loc7_;
      }
      this._loadCount = this._loadCount + 1;
      var keyName = fileName;
      var _loc6_ = keyName.lastIndexOf("\\");
      if(_loc6_ != -1)
      {
         keyName = keyName.substr(_loc6_ + 1,keyName.length - _loc6_ - 1);
      }
      var _loc9_ = fileName + ".swf";
      var info = new core.MovieLoadInfo();
      info.isOnLoad = false;
      info.fileName = fileName;
      info.mcName = keyName + "_" + this._loadCount;
      info.keyName = keyName;
      info.mc = this.createEmptyMovieClip(info.mcName,this.getNextHighestDepth());
      if(info.mc == undefined)
      {
         debug.Log("무비 생성실패 : " + info.mcName);
         return undefined;
      }
      this._arrMC.push(info);
      var _loc4_ = new Object();
      _loc4_._loader = this;
      _loc4_._keyName = keyName;
      _loc4_.onLoadComplete = function(target_mc, httpStatus)
      {
         var _loc2_;
         var _loc4_;
         for(var _loc5_ in target_mc)
         {
            _loc2_ = target_mc[_loc5_];
            if(typeof target_mc[_loc5_] == "movieclip")
            {
               _loc4_ = target_mc[_loc5_];
               if(_loc2_.onFileLoad != undefined)
               {
                  _loc2_.onFileLoad();
                  info.keyMovie = _loc2_;
               }
            }
         }
         this._loader.dispatchEventAndSound({type:"load",keyName:keyName,mc:target_mc,keyMovie:info.keyMovie});
         this._loader.onLoadMovieOne(fileName);
      };
      _loc4_.onLoadError = function(target_mc, errorCode, httpStatus)
      {
         debug.Log("onLoadError : " + target_mc + ", key : " + target_mc.keyName);
         debug.Log("  errorCode : " + errorCode);
         this._loader.dispatchEventAndSound({type:"error",keyName:keyName,mc:target_mc,errorCode:errorCode});
      };
      _loc4_.onLoadStart = function(target_mc)
      {
         target_mc.keyName = keyName;
         this._loader.dispatchEventAndSound({type:"start",keyName:keyName,mc:target_mc});
      };
      var _loc8_ = new MovieClipLoader();
      _loc8_.addListener(_loc4_);
      _loc8_.loadClip(_loc9_,info.mc);
      return info;
   }
   function Unload(keyName)
   {
      debug.Log("Unload " + keyName);
      var _loc6_ = this._arrMC.length;
      debug.Log("_arrMC.length : " + this._arrMC.length);
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = this._arrMC[_loc3_];
         debug.Log("keyName : " + _loc2_.keyName);
         if(_loc2_.keyName == keyName)
         {
            this.dispatchEventAndSound({type:"unload",keyName:_loc2_.keyName});
            _loc2_.mc.removeMovieClip();
            this._arrMC.splice(_loc3_,1);
            return undefined;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function getMCFileName(fileName)
   {
      var _loc4_ = this._arrMC.length;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._arrMC[_loc2_];
         if(_loc3_.fileName == fileName)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return undefined;
   }
   function getMC(keyName)
   {
      var _loc4_ = this._arrMC.length;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._arrMC[_loc2_];
         if(_loc3_.keyName == keyName)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return undefined;
   }
   function getTopDepthMC()
   {
      var _loc5_;
      var _loc4_;
      var _loc6_ = this._arrMC.length;
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = this._arrMC[_loc3_];
         if(_loc4_ == undefined)
         {
            _loc5_ = _loc2_;
            _loc4_ = _loc2_.mc.getDepth();
         }
         else if(_loc4_ < _loc2_.mc.getDepth())
         {
            _loc5_ = _loc2_;
            _loc4_ = _loc2_.mc.getDepth();
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc5_;
   }
   function setTopDepthMC(keyName)
   {
      var _loc2_ = this.getMC(keyName);
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      this.setTopDepth(_loc2_.mc);
   }
   function setTopDepth(mc)
   {
      var _loc5_ = mc.getDepth();
      var _loc6_ = this._arrMC.length;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc6_)
      {
         _loc3_ = this._arrMC[_loc2_];
         if(_loc3_.mc != mc)
         {
            if(_loc3_.mc.getDepth() > _loc5_)
            {
               mc.swapDepths(this.getNextHighestDepth());
               return undefined;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
