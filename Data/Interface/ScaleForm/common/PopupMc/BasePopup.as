class common.PopupMc.BasePopup extends core.EventMovieClip
{
   var _data;
   function BasePopup()
   {
      super();
   }
   function open()
   {
      this.onEvent({type:"open",data:this._data,comp:this});
   }
   function close(result)
   {
      this._visible = false;
      this._data.result = result;
      this.onEvent({type:"close",data:this._data});
   }
   function setData(info)
   {
      this._data = info;
      this.open();
   }
}
