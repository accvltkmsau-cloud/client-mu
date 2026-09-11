class HUD.NoticeMC.NoticeText extends MovieClip
{
   var _arrTexts;
   var tfNotice;
   var _devTxt;
   var onEnterFrame;
   var _intervalID;
   var _intervalTime = 10000;
   function NoticeText()
   {
      super();
      this._arrTexts = new Array();
   }
   function onLoad()
   {
      this.tfNotice.htmlText = "";
      if(this._devTxt != undefined)
      {
         this.onEnterFrame = this.updateDevText;
      }
      this._visible = false;
   }
   function setIntervalTime(n)
   {
      this._intervalTime = n;
   }
   function addText(msg)
   {
      this._arrTexts.push(msg);
      if(this._arrTexts.length > 6)
      {
         this._arrTexts.shift();
      }
      this._visible = true;
      this.updateText();
   }
   function clearTexts()
   {
      this._arrTexts.splice(0);
      this.updateText();
   }
   function updateDevText()
   {
      var _loc2_ = "count:" + this._arrTexts.length + "\n";
      _loc2_ += "_intervalID:" + this._intervalID;
      this._devTxt.text = _loc2_;
   }
   function onTextInterval()
   {
      if(this._intervalID)
      {
         return undefined;
      }
      this._intervalID = setInterval(this,"validateTexts",this._intervalTime);
   }
   function offTextInterval()
   {
      clearInterval(this._intervalID);
      delete this._intervalID;
   }
   function validateTexts()
   {
      if(this._arrTexts.length > 0)
      {
         this._arrTexts.shift();
      }
      this.updateText();
   }
   function updateText()
   {
      var _loc3_ = this._arrTexts.length;
      if(_loc3_ > 0)
      {
         this.onTextInterval();
      }
      else
      {
         this.offTextInterval();
         this._visible = false;
      }
      var _loc4_ = "";
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         _loc4_ += this._arrTexts[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      this.tfNotice.html = true;
      this.tfNotice.htmlText = _loc4_;
   }
}
