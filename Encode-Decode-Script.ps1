function Encode-Script($script){

$charArray = $script.ToCharArray()| %{[int][char]$_}
$hexString=""
$count=1
#combin two hex into one unicode
foreach($char in $charArray){
  $hexValue = [System.Convert]::ToString($char,16)
  if($hexValue.Length -eq 1){
    $hexValue ="0"+$hexValue

 }
 if($count%2 -ne 0){
 if($count -eq $text.Length){
 $hexString+="0x00"+$hexValue
 }else{
 $hexString+="0x"+$hexValue
 }
 }
 
 else{
 $hexString+=$hexValue+"|"
 }
 $count++
}
 $unicodeResult=$hexString.Split("|",[System.StringSplitOptions]::RemoveEmptyEntries)| %{[char]::ConvertFromUtf32($_)}

 return $unicodeResult -join ''
 }

 function Decode-run-script ($encodedScript){
    $UnicodeArray = $encodedScript.ToCharArray()| %{[int64][char]$_} 
    $UniCodeValueString=""
    foreach($Unicode in $UnicodeArray){
    $UnicodeValue = [System.Convert]::ToString($Unicode,16)
    if($UnicodeValue.Length -lt 4){
        $UnicodeValue ="0"+$UnicodeValue
        }
    $UniCodeValueString+=($UnicodeValue.Insert(2,"|"))+"|"
    }

    $DecodeArray = $UniCodeValueString.Split("|",[System.StringSplitOptions]::RemoveEmptyEntries)| %{[char]([System.Convert]::ToInt16($_,16))}
    Invoke-Expression ($DecodeArray -Join '')
 }
 function Decode-script ($encodedScript){
    $UnicodeArray = $encodedScript.ToCharArray()| %{[int64][char]$_} 
    $UniCodeValueString=""
    foreach($Unicode in $UnicodeArray){
    $UnicodeValue = [System.Convert]::ToString($Unicode,16)
    if($UnicodeValue.Length -lt 4){
        $UnicodeValue ="0"+$UnicodeValue
        }
    $UniCodeValueString+=($UnicodeValue.Insert(2,"|"))+"|"
    }

    $DecodeArray = $UniCodeValueString.Split("|",[System.StringSplitOptions]::RemoveEmptyEntries)| %{[char]([System.Convert]::ToInt16($_,16))}
    return $DecodeArray -Join ''
 }
 
