<?php 
$app = "headphones";
$appname = "Headphones";
$appversion = "0.5.9";
$appsite = "https://github.com/rembo10/headphones";
$apphelp = "https://github.com/rembo10/headphones/wiki/Usage-guide";

$applogs = array("/tmp/DroboApps/".$app."/log.txt",
                 "/tmp/DroboApps/".$app."/".$app.".log");

$appprotos = array("http");
$appports = array("8181");
$droboip = $_SERVER['SERVER_ADDR'];
$apppage = $appprotos[0]."://".$droboip.":".$appports[0]."/";
if ($publicip != "") {
  $publicurl = $appprotos[0]."://".$publicip.":".$appports[0]."/";
} else {
  $publicurl = $appprotos[0]."://public.ip.address.here:".$appports[0]."/";
}
$portscansite = "http://mxtoolbox.com/SuperTool.aspx?action=scan%3a".$publicip."&run=toolpage";
?>
