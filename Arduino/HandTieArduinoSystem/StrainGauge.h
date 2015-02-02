#ifndef StrainGauge_h
#define StrainGauge_h

#include <Arduino.h>

class StrainGauge
{
public:
   StrainGauge();
   StrainGauge(uint8_t, uint8_t, uint16_t, uint16_t);
   ~StrainGauge();

   void setAmpPotPos(uint8_t);
   uint8_t getAmpPotPos();

   void setBridgePotPos(uint8_t);
   uint8_t getBridgePotPos();

   void setTargetValNoAmp(uint16_t);
   uint16_t getTargetValNoAmp();

   void setTargetValWithAmp(uint16_t);
   uint16_t getTargetValWithAmp();

   void setBridgeCaliNeeded();
   void setBridgeCaliComplete();
   boolean isBridgeCaliComplete();

   void setAmpCaliNeeded();
   void setAmpCaliComplete();
   boolean isAmpCaliComplete();

private:
   uint8_t ampPotPos;
   uint8_t bridgePotPos;

   uint16_t targetValNoAmp;
   uint16_t targetValWithAmp;

   boolean bridgeCaliComplete;
   boolean ampCaliComplete;
};

#endif   //StrainGauge_h
