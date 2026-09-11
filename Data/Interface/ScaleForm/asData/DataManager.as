class asData.DataManager extends core.KeyMovieClip
{
   var _keyName;
   var onEnterFrame;
   var skill;
   function DataManager()
   {
      super();
      this._keyName = "ASData";
   }
   function onLoad()
   {
      this.onEnterFrame = this.onCheckLoadAll;
   }
   function onCheckLoadAll()
   {
      if(this.skill.isLoad != true)
      {
         return undefined;
      }
      this.onEnterFrame = null;
      gSystem.DataMan = this;
      super.onLoad();
   }
}
