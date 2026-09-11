class core.FunTestPramList extends gfx.controls.ScrollingList
{
   var renderers;
   function FunTestPramList()
   {
      super();
   }
   function dispatchItemEvent(event)
   {
      var _loc10_;
      switch(event.type)
      {
         case "press":
            _loc10_ = "itemPress";
            break;
         case "click":
            _loc10_ = "itemClick";
            break;
         case "rollOver":
            _loc10_ = "itemRollOver";
            break;
         case "rollOut":
            _loc10_ = "itemRollOut";
            break;
         case "doubleClick":
            _loc10_ = "itemDoubleClick";
            break;
         case "changePram":
            _loc10_ = "changePram";
            break;
         default:
            return undefined;
      }
      var _loc3_ = {itemComp:event.comp,target:this,type:_loc10_,item:event.target.data,renderer:event.target,index:event.target.index,controllerIdx:event.controllerIdx};
      this.dispatchEventAndSound(_loc3_);
   }
   function setUpRenderer(clip)
   {
      super.setUpRenderer(clip);
      clip.addEventListener("changePram",this,"dispatchItemEvent");
   }
   function setRendererList(value)
   {
      var _loc3_;
      var _loc2_;
      if(this.externalRenderers)
      {
         _loc3_ = 0;
         while(_loc3_ < this.renderers.length)
         {
            _loc2_ = this.renderers[_loc3_];
            _loc2_.owner = null;
            _loc2_.removeEventListener("click",this,"handleItemClick");
            _loc2_.removeEventListener("rollOver",this,"dispatchItemEvent");
            _loc2_.removeEventListener("rollOut",this,"dispatchItemEvent");
            _loc2_.removeEventListener("press",this,"dispatchItemEvent");
            _loc2_.removeEventListener("doubleClick",this,"dispatchItemEvent");
            _loc2_.removeEventListener("changePram",this,"dispatchItemEvent");
            Mouse.removeListener(_loc2_);
            _loc3_ = _loc3_ + 1;
         }
      }
      else
      {
         this.resetRenderers();
      }
      this.externalRenderers = value != null;
      if(this.externalRenderers)
      {
         this.renderers = value;
      }
      this.invalidate();
   }
}
