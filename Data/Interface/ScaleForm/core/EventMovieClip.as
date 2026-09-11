class core.EventMovieClip extends MovieClip
{
   var dispatchEvent;
   var invalidationIntervalID;
   function EventMovieClip()
   {
      super();
      gfx.events.EventDispatcher.initialize(this);
   }
   function onEvent(e)
   {
      this.dispatchEvent(e);
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
