class gSystem
{
   static var _uiBase;
   static var _mcMouse;
   static var _mcFunTest;
   static var _tooltipMan;
   static var _popups;
   static var _winMan;
   static var _imageLoader;
   static var _DataMan;
   static var _btFocus;
   static var _useDevMode = true;
   static var _useCustomMouse = false;
   static var _useFunctionTest = false;
   static var _useDebugLog = true;
   function gSystem()
   {
   }
   static function get isClient()
   {
      return _root.isClient == true;
   }
   static function setUIBase(ui)
   {
      gSystem._uiBase = ui;
   }
   static function get isMainScene()
   {
      return gSystem._uiBase.IsMainScene();
   }
   static function get useDevMode()
   {
      return gSystem._useDevMode;
   }
   static function set useDevMode(b)
   {
      if(gSystem._useDevMode == b)
      {
         return;
      }
      gSystem._useDevMode = b;
   }
   static function get mcMouse()
   {
      return gSystem._mcMouse;
   }
   static function set mcMouse(mc)
   {
      gSystem._mcMouse = mc;
   }
   static function get useCustomMouse()
   {
      return gSystem._useCustomMouse;
   }
   static function set useCustomMouse(b)
   {
      if(gSystem._useCustomMouse == b)
      {
         return;
      }
      gSystem._useCustomMouse = b;
      gSystem._mcMouse.useCustomMouse(b);
   }
   static function set mcFunctionTest(mc)
   {
      gSystem._mcFunTest = mc;
   }
   static function get mcFunctionTest()
   {
      return gSystem._mcFunTest;
   }
   static function get useFunctionTest()
   {
      return gSystem._useFunctionTest;
   }
   static function set useFunctionTest(b)
   {
      if(gSystem._useFunctionTest == b)
      {
         return;
      }
      gSystem._useFunctionTest = b;
      gSystem._mcFunTest.useFunctionTest(b);
   }
   static function get useDebugLog()
   {
      return gSystem._useDebugLog;
   }
   static function set useDebugLog(b)
   {
      gSystem._useDebugLog = b;
   }
   static function get Tooltip()
   {
      return gSystem._tooltipMan;
   }
   static function set Tooltip(mcTooltipMan)
   {
      gSystem._tooltipMan = mcTooltipMan;
   }
   static function get Popup()
   {
      return gSystem._popups;
   }
   static function set Popup(mcPopup)
   {
      gSystem._popups = mcPopup;
   }
   static function IsLoadAllHUDObj()
   {
      if(gSystem._tooltipMan == undefined)
      {
         return false;
      }
      if(gSystem._popups == undefined)
      {
         return false;
      }
      return true;
   }
   static function get WinMan()
   {
      return gSystem._winMan;
   }
   static function set WinMan(mc)
   {
      gSystem._winMan = mc;
   }
   static function get Image()
   {
      return gSystem._imageLoader;
   }
   static function set Image(mcImage)
   {
      gSystem._imageLoader = mcImage;
   }
   static function IsLoadAllDataObj()
   {
      if(gSystem._imageLoader == undefined)
      {
         return false;
      }
      return true;
   }
   static function get DataMan()
   {
      return gSystem._DataMan;
   }
   static function set DataMan(mcData)
   {
      gSystem._DataMan = mcData;
   }
   static function setFocusButton(bt)
   {
      gSystem._btFocus = bt;
   }
   static function clearFocus()
   {
      gSystem._btFocus.focused = 0;
      gSystem._btFocus.focused = 1;
   }
}
