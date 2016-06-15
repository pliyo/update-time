
$apiKey = "YourKeyGoesHere"
[xml]$doc = (New-Object System.Net.WebClient).DownloadString("http://api.timezonedb.com/?lat=51.5235633&lng=-0.10967589999999999&key=$apiKey")

$timestamp = $doc.InnerXml.Substring(229, 10) # 226

if($timestamp -match "[0-9]")
{
    $epoch = [datetime]"1/1/1970"
    $utc = $epoch.AddSeconds($timestamp)

    Write-Host $utc
    set-date $utc
}
else
{
    Write-Host "Failed to retrieve info"
}