class asData.container.SkillContainer extends MovieClip
{
   var _arrDatas;
   var _containerName;
   var _isLoad;
   function SkillContainer()
   {
      super();
      this._arrDatas = new Array();
      this._containerName = "skill";
      this._isLoad = false;
   }
   function get isLoad()
   {
      return this._isLoad;
   }
   function onLoad()
   {
      this._isLoad = true;
   }
   function getCount()
   {
      return this._arrDatas.length;
   }
   function getDataAll()
   {
      return this._arrDatas;
   }
   function setSkillAll(arrSkills)
   {
      this._arrDatas = arrSkills;
   }
   function clearAll()
   {
      this._arrDatas.splice(0);
   }
   function erase(index)
   {
      var _loc4_ = this._arrDatas.length;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._arrDatas[_loc2_];
         if(_loc3_.Index == index)
         {
            this._arrDatas.splice(_loc2_,1);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function insert(info)
   {
      if(info == undefined || info.Index == NaN || info.Index == undefined)
      {
         return undefined;
      }
      var _loc3_ = this.getData(info.Index);
      if(_loc3_ == undefined)
      {
         this._arrDatas.push(info);
      }
   }
   function getData(index)
   {
      var _loc4_ = this._arrDatas.length;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._arrDatas[_loc2_];
         if(_loc3_.Index == index)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return undefined;
   }
}
