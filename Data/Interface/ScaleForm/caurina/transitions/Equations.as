class caurina.transitions.Equations
{
   function Equations()
   {
      trace("Equations is a static class and should not be instantiated.");
   }
   static function init()
   {
      caurina.transitions.Tweener.registerTransition("easenone",caurina.transitions.Equations.easeNone);
      caurina.transitions.Tweener.registerTransition("linear",caurina.transitions.Equations.easeNone);
      caurina.transitions.Tweener.registerTransition("easeinquad",caurina.transitions.Equations.easeInQuad);
      caurina.transitions.Tweener.registerTransition("easeoutquad",caurina.transitions.Equations.easeOutQuad);
      caurina.transitions.Tweener.registerTransition("easeinoutquad",caurina.transitions.Equations.easeInOutQuad);
      caurina.transitions.Tweener.registerTransition("easeoutinquad",caurina.transitions.Equations.easeOutInQuad);
      caurina.transitions.Tweener.registerTransition("easeincubic",caurina.transitions.Equations.easeInCubic);
      caurina.transitions.Tweener.registerTransition("easeoutcubic",caurina.transitions.Equations.easeOutCubic);
      caurina.transitions.Tweener.registerTransition("easeinoutcubic",caurina.transitions.Equations.easeInOutCubic);
      caurina.transitions.Tweener.registerTransition("easeoutincubic",caurina.transitions.Equations.easeOutInCubic);
      caurina.transitions.Tweener.registerTransition("easeinquart",caurina.transitions.Equations.easeInQuart);
      caurina.transitions.Tweener.registerTransition("easeoutquart",caurina.transitions.Equations.easeOutQuart);
      caurina.transitions.Tweener.registerTransition("easeinoutquart",caurina.transitions.Equations.easeInOutQuart);
      caurina.transitions.Tweener.registerTransition("easeoutinquart",caurina.transitions.Equations.easeOutInQuart);
      caurina.transitions.Tweener.registerTransition("easeinquint",caurina.transitions.Equations.easeInQuint);
      caurina.transitions.Tweener.registerTransition("easeoutquint",caurina.transitions.Equations.easeOutQuint);
      caurina.transitions.Tweener.registerTransition("easeinoutquint",caurina.transitions.Equations.easeInOutQuint);
      caurina.transitions.Tweener.registerTransition("easeoutinquint",caurina.transitions.Equations.easeOutInQuint);
      caurina.transitions.Tweener.registerTransition("easeinsine",caurina.transitions.Equations.easeInSine);
      caurina.transitions.Tweener.registerTransition("easeoutsine",caurina.transitions.Equations.easeOutSine);
      caurina.transitions.Tweener.registerTransition("easeinoutsine",caurina.transitions.Equations.easeInOutSine);
      caurina.transitions.Tweener.registerTransition("easeoutinsine",caurina.transitions.Equations.easeOutInSine);
      caurina.transitions.Tweener.registerTransition("easeincirc",caurina.transitions.Equations.easeInCirc);
      caurina.transitions.Tweener.registerTransition("easeoutcirc",caurina.transitions.Equations.easeOutCirc);
      caurina.transitions.Tweener.registerTransition("easeinoutcirc",caurina.transitions.Equations.easeInOutCirc);
      caurina.transitions.Tweener.registerTransition("easeoutincirc",caurina.transitions.Equations.easeOutInCirc);
      caurina.transitions.Tweener.registerTransition("easeinexpo",caurina.transitions.Equations.easeInExpo);
      caurina.transitions.Tweener.registerTransition("easeoutexpo",caurina.transitions.Equations.easeOutExpo);
      caurina.transitions.Tweener.registerTransition("easeinoutexpo",caurina.transitions.Equations.easeInOutExpo);
      caurina.transitions.Tweener.registerTransition("easeoutinexpo",caurina.transitions.Equations.easeOutInExpo);
      caurina.transitions.Tweener.registerTransition("easeinelastic",caurina.transitions.Equations.easeInElastic);
      caurina.transitions.Tweener.registerTransition("easeoutelastic",caurina.transitions.Equations.easeOutElastic);
      caurina.transitions.Tweener.registerTransition("easeinoutelastic",caurina.transitions.Equations.easeInOutElastic);
      caurina.transitions.Tweener.registerTransition("easeoutinelastic",caurina.transitions.Equations.easeOutInElastic);
      caurina.transitions.Tweener.registerTransition("easeinback",caurina.transitions.Equations.easeInBack);
      caurina.transitions.Tweener.registerTransition("easeoutback",caurina.transitions.Equations.easeOutBack);
      caurina.transitions.Tweener.registerTransition("easeinoutback",caurina.transitions.Equations.easeInOutBack);
      caurina.transitions.Tweener.registerTransition("easeoutinback",caurina.transitions.Equations.easeOutInBack);
      caurina.transitions.Tweener.registerTransition("easeinbounce",caurina.transitions.Equations.easeInBounce);
      caurina.transitions.Tweener.registerTransition("easeoutbounce",caurina.transitions.Equations.easeOutBounce);
      caurina.transitions.Tweener.registerTransition("easeinoutbounce",caurina.transitions.Equations.easeInOutBounce);
      caurina.transitions.Tweener.registerTransition("easeoutinbounce",caurina.transitions.Equations.easeOutInBounce);
   }
   static function easeNone(t, b, c, d, p_params)
   {
      return c * t / d + b;
   }
   static function easeInQuad(t, b, c, d, p_params)
   {
      return c * (t /= d) * t + b;
   }
   static function easeOutQuad(t, b, c, d, p_params)
   {
      return (- c) * (t /= d) * (t - 2) + b;
   }
   static function easeInOutQuad(t, b, c, d, p_params)
   {
      if((t /= d / 2) < 1)
      {
         return c / 2 * t * t + b;
      }
      return (- c) / 2 * ((t = t - 1) * (t - 2) - 1) + b;
   }
   static function easeOutInQuad(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutQuad(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInQuad(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInCubic(t, b, c, d, p_params)
   {
      return c * (t /= d) * t * t + b;
   }
   static function easeOutCubic(t, b, c, d, p_params)
   {
      return c * ((t = t / d - 1) * t * t + 1) + b;
   }
   static function easeInOutCubic(t, b, c, d, p_params)
   {
      if((t /= d / 2) < 1)
      {
         return c / 2 * t * t * t + b;
      }
      return c / 2 * ((t -= 2) * t * t + 2) + b;
   }
   static function easeOutInCubic(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutCubic(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInCubic(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInQuart(t, b, c, d, p_params)
   {
      return c * (t /= d) * t * t * t + b;
   }
   static function easeOutQuart(t, b, c, d, p_params)
   {
      return (- c) * ((t = t / d - 1) * t * t * t - 1) + b;
   }
   static function easeInOutQuart(t, b, c, d, p_params)
   {
      if((t /= d / 2) < 1)
      {
         return c / 2 * t * t * t * t + b;
      }
      return (- c) / 2 * ((t -= 2) * t * t * t - 2) + b;
   }
   static function easeOutInQuart(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutQuart(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInQuart(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInQuint(t, b, c, d, p_params)
   {
      return c * (t /= d) * t * t * t * t + b;
   }
   static function easeOutQuint(t, b, c, d, p_params)
   {
      return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
   }
   static function easeInOutQuint(t, b, c, d, p_params)
   {
      if((t /= d / 2) < 1)
      {
         return c / 2 * t * t * t * t * t + b;
      }
      return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
   }
   static function easeOutInQuint(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutQuint(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInQuint(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInSine(t, b, c, d, p_params)
   {
      return (- c) * Math.cos(t / d * 1.5707963267948966) + c + b;
   }
   static function easeOutSine(t, b, c, d, p_params)
   {
      return c * Math.sin(t / d * 1.5707963267948966) + b;
   }
   static function easeInOutSine(t, b, c, d, p_params)
   {
      return (- c) / 2 * (Math.cos(3.141592653589793 * t / d) - 1) + b;
   }
   static function easeOutInSine(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutSine(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInSine(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInExpo(t, b, c, d, p_params)
   {
      return t != 0 ? c * Math.pow(2,10 * (t / d - 1)) + b - c * 0.001 : b;
   }
   static function easeOutExpo(t, b, c, d, p_params)
   {
      return t != d ? c * 1.001 * (- Math.pow(2,-10 * t / d) + 1) + b : b + c;
   }
   static function easeInOutExpo(t, b, c, d, p_params)
   {
      if(t == 0)
      {
         return b;
      }
      if(t == d)
      {
         return b + c;
      }
      if((t /= d / 2) < 1)
      {
         return c / 2 * Math.pow(2,10 * (t - 1)) + b - c * 0.0005;
      }
      return c / 2 * 1.0005 * (- Math.pow(2,-10 * (t = t - 1)) + 2) + b;
   }
   static function easeOutInExpo(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutExpo(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInExpo(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInCirc(t, b, c, d, p_params)
   {
      return (- c) * (Math.sqrt(1 - (t /= d) * t) - 1) + b;
   }
   static function easeOutCirc(t, b, c, d, p_params)
   {
      return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
   }
   static function easeInOutCirc(t, b, c, d, p_params)
   {
      if((t /= d / 2) < 1)
      {
         return (- c) / 2 * (Math.sqrt(1 - t * t) - 1) + b;
      }
      return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
   }
   static function easeOutInCirc(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutCirc(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInCirc(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInElastic(t, b, c, d, p_params)
   {
      if(t == 0)
      {
         return b;
      }
      if((t /= d) == 1)
      {
         return b + c;
      }
      var _loc2_ = p_params.period != undefined ? p_params.period : d * 0.3;
      var _loc5_;
      var _loc1_ = p_params.amplitude;
      if(!_loc1_ || _loc1_ < Math.abs(c))
      {
         _loc1_ = c;
         _loc5_ = _loc2_ / 4;
      }
      else
      {
         _loc5_ = _loc2_ / 6.283185307179586 * Math.asin(c / _loc1_);
      }
      return - _loc1_ * Math.pow(2,10 * (t -= 1)) * Math.sin((t * d - _loc5_) * 6.283185307179586 / _loc2_) + b;
   }
   static function easeOutElastic(t, b, c, d, p_params)
   {
      if(t == 0)
      {
         return b;
      }
      if((t /= d) == 1)
      {
         return b + c;
      }
      var _loc3_ = p_params.period != undefined ? p_params.period : d * 0.3;
      var _loc5_;
      var _loc1_ = p_params.amplitude;
      if(!_loc1_ || _loc1_ < Math.abs(c))
      {
         _loc1_ = c;
         _loc5_ = _loc3_ / 4;
      }
      else
      {
         _loc5_ = _loc3_ / 6.283185307179586 * Math.asin(c / _loc1_);
      }
      return _loc1_ * Math.pow(2,-10 * t) * Math.sin((t * d - _loc5_) * 6.283185307179586 / _loc3_) + c + b;
   }
   static function easeInOutElastic(t, b, c, d, p_params)
   {
      if(t == 0)
      {
         return b;
      }
      if((t /= d / 2) == 2)
      {
         return b + c;
      }
      var _loc3_ = p_params.period != undefined ? p_params.period : d * 0.44999999999999996;
      var _loc5_;
      var _loc1_ = p_params.amplitude;
      if(!_loc1_ || _loc1_ < Math.abs(c))
      {
         _loc1_ = c;
         _loc5_ = _loc3_ / 4;
      }
      else
      {
         _loc5_ = _loc3_ / 6.283185307179586 * Math.asin(c / _loc1_);
      }
      if(t < 1)
      {
         return -0.5 * (_loc1_ * Math.pow(2,10 * (t -= 1)) * Math.sin((t * d - _loc5_) * 6.283185307179586 / _loc3_)) + b;
      }
      return _loc1_ * Math.pow(2,-10 * (t -= 1)) * Math.sin((t * d - _loc5_) * 6.283185307179586 / _loc3_) * 0.5 + c + b;
   }
   static function easeOutInElastic(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutElastic(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInElastic(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInBack(t, b, c, d, p_params)
   {
      var _loc1_ = p_params.overshoot != undefined ? p_params.overshoot : 1.70158;
      return c * (t /= d) * t * ((_loc1_ + 1) * t - _loc1_) + b;
   }
   static function easeOutBack(t, b, c, d, p_params)
   {
      var _loc2_ = p_params.overshoot != undefined ? p_params.overshoot : 1.70158;
      return c * ((t = t / d - 1) * t * ((_loc2_ + 1) * t + _loc2_) + 1) + b;
   }
   static function easeInOutBack(t, b, c, d, p_params)
   {
      var _loc2_ = p_params.overshoot != undefined ? p_params.overshoot : 1.70158;
      if((t /= d / 2) < 1)
      {
         return c / 2 * (t * t * (((_loc2_ *= 1.525) + 1) * t - _loc2_)) + b;
      }
      return c / 2 * ((t -= 2) * t * (((_loc2_ *= 1.525) + 1) * t + _loc2_) + 2) + b;
   }
   static function easeOutInBack(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutBack(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInBack(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
   static function easeInBounce(t, b, c, d, p_params)
   {
      return c - caurina.transitions.Equations.easeOutBounce(d - t,0,c,d) + b;
   }
   static function easeOutBounce(t, b, c, d, p_params)
   {
      if((t /= d) < 0.36363636363636365)
      {
         return c * (7.5625 * t * t) + b;
      }
      if(t < 0.7272727272727273)
      {
         return c * (7.5625 * (t -= 0.5454545454545454) * t + 0.75) + b;
      }
      if(t < 0.9090909090909091)
      {
         return c * (7.5625 * (t -= 0.8181818181818182) * t + 0.9375) + b;
      }
      return c * (7.5625 * (t -= 0.9545454545454546) * t + 0.984375) + b;
   }
   static function easeInOutBounce(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeInBounce(t * 2,0,c,d) * 0.5 + b;
      }
      return caurina.transitions.Equations.easeOutBounce(t * 2 - d,0,c,d) * 0.5 + c * 0.5 + b;
   }
   static function easeOutInBounce(t, b, c, d, p_params)
   {
      if(t < d / 2)
      {
         return caurina.transitions.Equations.easeOutBounce(t * 2,b,c / 2,d,p_params);
      }
      return caurina.transitions.Equations.easeInBounce(t * 2 - d,b + c / 2,c / 2,d,p_params);
   }
}
