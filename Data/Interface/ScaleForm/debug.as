class debug
{
   function debug()
   {
   }
   static function Log(text)
   {
      if(gSystem.useDebugLog == false)
      {
         return undefined;
      }
      trace(text);
   }
}
