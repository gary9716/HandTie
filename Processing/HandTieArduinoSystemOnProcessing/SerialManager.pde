import processing.serial.*;

public class SerialManager{

   final static int SERIAL_PORT_BAUD_RATE = 115200;
   final static int SERIAL_PORT_NUM = 7;

   Serial arduinoPort;

   public SerialManager(HandTieArduinoSystemOnProcessing mainClass){
      // Setup serial port I/O
      println("AVAILABLE SERIAL PORTS:");
      println(Serial.list());
      String portName = Serial.list()[SERIAL_PORT_NUM];
      println();
      println("LOOK AT THE LIST ABOVE AND SET THE RIGHT SERIAL PORT NUMBER IN THE CODE!");
      println("  -> Using port " + SERIAL_PORT_NUM + ": " + portName);
      arduinoPort = new Serial(mainClass, portName, SERIAL_PORT_BAUD_RATE);
      arduinoPort.bufferUntil(10);    //newline
   }

   public int [] parseDataFromArduino(Serial port) throws Exception{
      String buf = port.readString();
      String [] bufSplitArr = buf.split(" ");
      int [] parsedDataArr = new int[bufSplitArr.length-1];

      for (int i = 0; i < bufSplitArr.length-1; ++i)
         parsedDataArr[i] = Integer.parseInt(bufSplitArr[i]);

      return parsedDataArr;
   }

   public void sendToArduino(String str){
      arduinoPort.write(str);
   }
}