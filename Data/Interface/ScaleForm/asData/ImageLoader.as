class asData.ImageLoader extends MovieClip
{
   var _Images;
   var IconSkill = 0;
   var IconSkillNon = 1;
   var IconSkillMaster = 2;
   var IconSkillMasterNon = 3;
   var IconSkill4th = 4;
   var IconSkill4thNon = 5;
   function ImageLoader()
   {
      super();
   }
   function onLoad()
   {
      this._Images = new Array();
      this._Images[0] = this.getBitmap("Icon_Skill-nopack");
      this._Images[1] = this.getBitmap("Icon_Skill_non-nopack");
      this._Images[2] = this.getBitmap("Icon_MasterSkill-nopack");
      this._Images[3] = this.getBitmap("Icon_MasterSkill_non-nopack");
      this._Images[4] = this.getBitmap("4th_Skill_Icon-nopack");
      this._Images[5] = this.getBitmap("4th_Skill_Non_Icon-nopack");
      gSystem.Image = this;
      if(_root.isClient != true)
      {
      }
   }
   function onUnload()
   {
      this._Images.splice(0);
      this._Images = undefined;
   }
   function DrawIcon_Buff(targetMC, buffIndex)
   {
      var _loc2_ = this.getBitmap("icon_" + buffIndex);
      return this.AttachImg(targetMC,_loc2_);
   }
   function DrawIcon_Skill(targetMC, info, bNon)
   {
      var _loc4_;
      var _loc2_ = 0;
      switch(info.SkillUseType)
      {
         case 0:
         case 1:
            _loc2_ = this.IconSkill;
            break;
         case 3:
         case 4:
            _loc2_ = this.IconSkillMaster;
            break;
         case 7:
         case 8:
         case 9:
            _loc2_ = this.IconSkill4th;
      }
      if(bNon == true)
      {
         _loc2_ = _loc2_ + 1;
      }
      _loc4_ = this._Images[_loc2_];
      switch(info.SkillUseType)
      {
         case 0:
         case 1:
      }
      if(_loc4_ == undefined)
      {
         return false;
      }
      var _loc6_ = 20;
      var _loc5_ = 28;
      var _loc8_ = Math.floor(info.Magic_Icon % 25) * _loc6_;
      var _loc7_ = Math.floor(info.Magic_Icon / 25) * _loc5_;
      this.DrawImg(targetMC,_loc4_,_loc8_,_loc7_,_loc6_,_loc5_);
      return true;
   }
   function AttachImg(targetMC, img)
   {
      if(img == undefined)
      {
         return false;
      }
      var _loc1_;
      if(targetMC.mcDrawImg != undefined)
      {
         _loc1_ = targetMC.mcDrawImg;
         _loc1_.clear();
      }
      else
      {
         _loc1_ = targetMC.createEmptyMovieClip("mcDrawImg",targetMC.getNextHighestDepth());
      }
      _loc1_.attachBitmap(img,1,"auto",true);
      return true;
   }
   function DrawImg(targetMC, img, x, y, w, h)
   {
      if(img == undefined)
      {
         return undefined;
      }
      var mcDrawImg;
      if(targetMC.mcDrawImg != undefined)
      {
         mcDrawImg = targetMC.mcDrawImg;
         mcDrawImg.clear();
      }
      else
      {
         mcDrawImg = targetMC.createEmptyMovieClip("mcDrawImg",targetMC.getNextHighestDepth());
      }
      with(mcDrawImg)
      {
         _x = - x;
         _y = - y;
         beginBitmapFill(img,null,true,true);
         moveTo(x,y);
         lineTo(x,y + h);
         lineTo(x + w,y + h);
         lineTo(x + w,y);
         lineTo(x,y);
         endFill();
      }
   }
   function getBitmap(exportName)
   {
      return this._parent.getBitmap(exportName);
   }
   function getRootBitmap(idx)
   {
      return _root.getBitmap(idx);
   }
   function DrawRootImg(targetMC, imgIndex, x, y, w, h)
   {
      var img = this.getRootBitmap(imgIndex);
      if(img == undefined)
      {
         return undefined;
      }
      var mcDrawImg;
      if(targetMC.mcDrawImg != undefined)
      {
         mcDrawImg = targetMC.mcDrawImg;
         mcDrawImg.clear();
      }
      else
      {
         mcDrawImg = targetMC.createEmptyMovieClip("mcDrawImg",targetMC.getNextHighestDepth());
      }
      var mat = new flash.geom.Matrix();
      mat.identity();
      mat.scale(1,-1);
      with(mcDrawImg)
      {
         _x = - x;
         _y = - y;
         beginBitmapFill(img,mat,true,true);
         moveTo(x,y);
         lineTo(x,y + h);
         lineTo(x + w,y + h);
         lineTo(x + w,y);
         lineTo(x,y);
         endFill();
      }
   }
}
