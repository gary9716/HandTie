public class SGManager{
   
   public final static int NUM_OF_GAUGES = 16;
   public boolean requestForCaliVals = true;
   public boolean hideBar = false;
   public boolean hideText = false;

   private StrainGauge [] gauges = new StrainGauge[NUM_OF_GAUGES];

   public SGManager(){
      for (int i = 0; i < gauges.length; ++i) {
         gauges[i] = new StrainGauge();
         // println("width = " + width);
         gauges[i].setBarDisplayProperties(width*(i+1)*0.04,
                                           height*0.7, 20);
         gauges[i].setTextDisplayPropertiesForElong(width*(i+1)*0.04-5,
                                                    height*((i%2==1)?0.84:0.82),
                                                    14);
         gauges[i].setTextDisplayPropertiesForAnalogVal(width*(i+1)*0.04-5,
                                                        height*((i%2==1)?0.87:0.85),
                                                        15);
      }
   }

   public void setValuesForGauges(int [] newValues){
      if (requestForCaliVals) {
         setCaliValsForGauges(newValues);
         requestForCaliVals = false;
      } else {
         setNewAnalogValsForGauges(newValues);
      }
   }

   public void setNewAnalogValsForGauges(int [] newValues){
      for (int i = 0; i < gauges.length; ++i) {
         gauges[i].setNewValue(newValues[i]);
      }
   }

   public void setCaliValsForGauges(int [] newValues){
      for (int i = 0; i < gauges.length; ++i) {
         gauges[i].setCalibrationValue(newValues[i]);
      }
   }

   public int getOneCaliValForGauges(int index){
      return gauges[index].getCalibrationValue();
   }

   public int [] getAnalogValsOfGauges(){
      int [] analogVals = new int[gauges.length];
      for (int i = 0; i < gauges.length; ++i) {
         analogVals[i] = gauges[i].getNewValue();
      }
      return analogVals;
   }
   public float [] getElongationValsOfGauges(){
      float [] elongationVals = new float[gauges.length];
      for (int i = 0; i < gauges.length; ++i) {
         elongationVals[i] = gauges[i].getElongationValue();
      }
      return elongationVals;
   }

   public float getOneElongationValsOfGauges(int index){
      return gauges[index].getElongationValue();
   }

   public float [] getOneBarBaseCenterOfGauges(int index){
      return gauges[index].getBarBaseCenter();
   }

   public void draw(){
      for (int i = 0; i < gauges.length; i++) {
         if (!hideBar)  gauges[i].drawBar();
         if (!hideText) gauges[i].drawText();
      }
   }
}
