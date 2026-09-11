class dev.FunTest extends MovieClip
{
   var constraints;
   var _txTitle;
   var _btClose;
   var _btCall;
   var _slTestFunName;
   var sr0;
   var _slTestFunParam;
   var sr1;
   var resizeBtn;
   var _back;
   var _arrFunInfo;
   var dragProps;
   var onMouseMove;
   var noAdvance;
   var _selectFunInfo;
   var _UIName;
   var _callMovie;
   function FunTest()
   {
      super();
   }
   function onLoad()
   {
      this._visible = false;
      this.constraints = new gfx.utils.Constraints(this);
      this.constraints.addElement(this._txTitle,gfx.utils.Constraints.LEFT);
      this.constraints.addElement(this._btClose,gfx.utils.Constraints.RIGHT);
      this.constraints.addElement(this._btCall,gfx.utils.Constraints.RIGHT);
      this.constraints.addElement(this._slTestFunName,gfx.utils.Constraints.LEFT | gfx.utils.Constraints.TOP | gfx.utils.Constraints.BOTTOM);
      this.constraints.addElement(this.sr0,gfx.utils.Constraints.LEFT | gfx.utils.Constraints.TOP | gfx.utils.Constraints.BOTTOM);
      this.constraints.addElement(this._slTestFunParam,gfx.utils.Constraints.ALL);
      this.constraints.addElement(this.sr1,gfx.utils.Constraints.ALL);
      this.constraints.addElement(this.resizeBtn,gfx.utils.Constraints.RIGHT | gfx.utils.Constraints.BOTTOM);
      this.constraints.addElement(this._back,gfx.utils.Constraints.ALL);
      this._slTestFunName.addEventListener("itemClick",this,"onSelectFunName");
      this._slTestFunParam.addEventListener("changePram",this,"onChangeFunPram");
      this._btClose.addEventListener("click",this,"onClose");
      this._btCall.addEventListener("click",this,"onFunctionCall");
      this._arrFunInfo = new Array();
      this._back.tabEnabled = false;
      this._back.focusEnabled = false;
      this._back.onPress = function()
      {
         this._parent.handleDragStart();
      };
      this._back.onMouseUp = function()
      {
         this._parent.handleDragStop();
      };
      this.resizeBtn.addEventListener("press",this,"handleResizeDragStart");
      this.resizeBtn.addEventListener("click",this,"handleResizeDragStop");
      this.resizeBtn.addEventListener("releaseOutside",this,"handleResizeDragStop");
      gSystem.mcFunctionTest = this;
      gSystem.useFunctionTest = gSystem.isClient == false;
   }
   function handleResizeDragStart()
   {
      this.dragProps = [this._parent._xmouse - (this._x + this._width),this._parent._ymouse - (this._y + this._height)];
      this.onMouseMove = this.handleResize;
   }
   function handleResizeDragStop()
   {
      this.onMouseMove = null;
      delete this.onMouseMove;
   }
   function handleResize()
   {
      this.setSize(this._width,Math.max(175,Math.min(800,this._parent._ymouse - this._y - this.dragProps[1])));
   }
   function setSize(w, h)
   {
      trace("setSize : " + w + " " + h);
      this.constraints.update(w,h);
   }
   function useFunctionTest(b)
   {
      if(b == true)
      {
         this.noAdvance = false;
         Mouse.addListener(this);
      }
      else
      {
         Mouse.removeListener(this);
         this._visible = false;
         this.noAdvance = true;
      }
   }
   function handleDragStart()
   {
      this.startDrag(false);
   }
   function handleDragStop()
   {
      this.stopDrag();
   }
   function onSelectFunName(e)
   {
      this._selectFunInfo = this._arrFunInfo[e.index];
      this._txTitle.text = this._UIName + " : " + this._selectFunInfo._callFunName;
      this._slTestFunParam.dataProvider = this._selectFunInfo._arrPram;
   }
   function onFunctionCall(e)
   {
      trace("onFunctionCall");
      this.onChangeFunPram();
   }
   function onChangeFunPram(e)
   {
      var _loc4_ = this._selectFunInfo._arrPram.length;
      var _loc5_;
      var _loc2_;
      var _loc3_;
      switch(_loc4_)
      {
         case 0:
            this._callMovie[this._selectFunInfo._callFunName]();
            break;
         case 1:
            this._callMovie[this._selectFunInfo._callFunName](this._selectFunInfo._arrPram[0].value);
            break;
         default:
            _loc5_ = new Object();
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               _loc3_ = this._selectFunInfo._arrPram[_loc2_];
               _loc5_[_loc3_.member] = _loc3_.value;
               _loc2_ = _loc2_ + 1;
            }
            this._callMovie[this._selectFunInfo._callFunName](_loc5_);
      }
   }
   function setUIName(UIName)
   {
      this._UIName = UIName;
      this._txTitle.text = this._UIName;
      this._arrFunInfo.splice(0);
   }
   function addFunInfo(funName, defaultPram)
   {
      var _loc2_ = new dev.FunTestAssets.FunTestInfo(funName,defaultPram);
      this._arrFunInfo.push(_loc2_);
   }
   function onMouseDown(button, targetPath)
   {
      if(gSystem.useFunctionTest == false)
      {
         return undefined;
      }
      if(this._visible == true)
      {
         return undefined;
      }
      if(button != 2)
      {
         return undefined;
      }
      var targetObj = eval(targetPath);
      while(targetObj != null && targetObj != _root)
      {
         if(targetObj.devFunTest != undefined)
         {
            this._arrFunInfo.splice(0);
            this._callMovie = undefined;
            this._selectFunInfo = undefined;
            this._slTestFunName.dataProvider = undefined;
            this._slTestFunParam.dataProvider = undefined;
            this._callMovie = MovieClip(targetObj);
            this._callMovie.devFunTest(this);
            if(this._arrFunInfo.length > 0)
            {
               this.onOpenMenu();
            }
            return undefined;
         }
         targetObj = targetObj._parent;
      }
   }
   function onClose()
   {
      this._visible = false;
   }
   function onOpenMenu()
   {
      var _loc4_ = new Array();
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this._arrFunInfo.length)
      {
         _loc3_ = this._arrFunInfo[_loc2_];
         _loc4_.push(_loc3_._callFunName);
         _loc2_ = _loc2_ + 1;
      }
      this._slTestFunName.dataProvider = _loc4_;
      this._slTestFunName.selectedIndex = 0;
      this._visible = true;
   }
}
