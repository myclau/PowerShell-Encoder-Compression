. ./Encode-Decode-Script.ps1

$text = " `$u=5;`$l=70;
 if((Get-Ciminstance -Namespace root/WMI -ClassName WmiMonitorBrightness).CurrentBrightness -ge 50){
    `$i=`$u
 }else{
    `$i=`$l
 }
 (Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,`$i)
 "
 

 $encodeScript= Encode-Script "$text"
 write-host $encodeScript
 $originalText =  Decode-script "$encodeScript"
 write-host $originalText
 Decode-run-script "$encodeScript"
