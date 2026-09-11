class core.KeyMovieClip extends MovieClip
{
   var _keyName;
   var _mcPath;
   var invalidationIntervalID;
   function KeyMovieClip()
   {
      super();
   }
   function getKeyName()
   {
      return this._keyName;
   }
   function EventCall(cmd, pram)
   {
      flash.external.ExternalInterface.call(this._keyName,cmd,pram);
   }
   function onUnload()
   {
      this.EventCall("onUnload");
   }
   function onFileLoad()
   {
      this._mcPath = targetPath(this);
      this.EventCall("onLoad",this._mcPath);
   }
   function invalidate()
   {
      if(this.invalidationIntervalID)
      {
         return undefined;
      }
      this.invalidationIntervalID = setInterval(this,"validateNow",1);
   }
   function validateNow()
   {
      clearInterval(this.invalidationIntervalID);
      delete this.invalidationIntervalID;
      this.draw();
   }
   function draw()
   {
   }
}
