class util
{
   function util()
   {
   }
   static function TraceAllObjectInfo(info)
   {
      for(var _loc2_ in info)
      {
         debug.Log(_loc2_ + " : " + info[_loc2_]);
      }
   }
   static function TextAllObjectInfo(info)
   {
      var _loc2_ = "";
      for(var _loc3_ in info)
      {
         _loc2_ += _loc3_ + " : " + info[_loc3_] + "\n";
      }
      return _loc2_;
   }
   static function random(min, max)
   {
      return Math.floor(Math.random() * (max - min + 1)) + min;
   }
   static function localToGlobal(mc)
   {
      var _loc1_ = {x:0,y:0};
      mc.localToGlobal(_loc1_);
      return _loc1_;
   }
   static function MouseHitTestMovie(target)
   {
      var _loc2_ = Mouse.getTopMostEntity(false);
      while(_loc2_ != null && _loc2_ != _root)
      {
         if(_loc2_ == target)
         {
            return true;
         }
         _loc2_ = _loc2_._parent;
      }
   }
   static function TextFieldAlignCenter(tx)
   {
      tx.textAutoSize = "shrink";
      tx.verticalAlign = "center";
   }
   static function ObjectLenght(myObj)
   {
      var _loc1_ = 0;
      for(var _loc2_ in myObj)
      {
         _loc1_ = _loc1_ + 1;
      }
      return _loc1_;
   }
}
