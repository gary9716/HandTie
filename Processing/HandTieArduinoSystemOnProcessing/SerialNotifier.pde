public interface SerialNotifier{
   public void registerForSerialListener(SerialListener listener);
   public void removeSerialListener(SerialListener listener);
   
   public void notifyAllWithAnalogVals(int [] values);
   public void notifyAllWithCaliVals(int [] values);
   public void notifyAllWithTargetAnalogValsNoAmp(int [] values);
   public void notifyAllWithTargetAnalogValsWithAmp(int [] values);
}