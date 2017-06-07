
#SetDirectory
cd C:\Scripts





#lCM
[DSCLocalConfigurationManager()]
configuration LCMConfig
{ Param (
        [Parameter(Mandatory=$true)]
        [string[]]$ComputerName
    )
    Node localhost
    {
        Settings
        {
            RefreshMode = 'Push'
            ConfigurationMode =  'ApplyAndAutoCorrect'
            ConfigurationModeFrequencyMins = '60'
        }
    }
}

LCMConfig -computername localhost -verbose
Set-DscLocalConfigurationManager -Path C:\Scripts\LCMConfig -ComputerName localhost -Verbose


Start-Sleep -s 10

#DSC Config
Configuration AzureMgmtPackPrep
 {
    Param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $computername
       
    )

    Import-DscResource -ModuleName XPSDesiredStateConfiguration 

    Node $Computername {

    WindowsFeature Web-Default-Doc {
            Ensure = "Present"
            Name =    "Web-Default-Doc"
        }

    WindowsFeature Web-Dir-Browsing {
            Ensure = "Present"
            Name =    "Web-Dir-Browsing"
        }
   
    WindowsFeature Web-Http-Errors {
            Ensure = "Present"
            Name =    "Web-Http-Errors"
        }

    WindowsFeature Web-Static-Content {
            Ensure = "Present"
            Name =    "Web-Static-Content"
        }
    WindowsFeature Web-Http-Logging {
            Ensure = "Present"
            Name =    "Web-Http-Logging"
        }

    WindowsFeature Web-Stat-Compression {
            Ensure = "Present"
            Name =    "Web-Stat-Compression"
        }

    WindowsFeature Web-Dyn-Compression {
            Ensure = "Present"
            Name =    "Web-Dyn-Compression"
        }
    
    WindowsFeature Web-Filtering {
            Ensure = "Present"
            Name =    "Web-Filtering"
        }

    WindowsFeature Web-Basic-Auth {
            Ensure = "Present"
            Name =    "Web-Basic-Auth"
        }

    WindowsFeature Web-Url-Auth {
            Ensure = "Present"
            Name =    "Web-Url-Auth"
        }

    WindowsFeature Web-Windows-Auth {
            Ensure = "Present"
            Name =    "Web-Windows-Auth"
        }


    WindowsFeature Web-Asp-Net45 {
            Ensure = "Present"
            Name =    "Web-Asp-Net45"
        }

    WindowsFeature Web-Net-Ext45 {
            Ensure = "Present"
            Name =    "Web-Net-Ext45"
        }

    WindowsFeature Web-ISAPI-Ext {
            Ensure = "Present"
            Name =    "Web-ISAPI-Ext"
        }

    WindowsFeature Web-ISAPI-Filter {
            Ensure = "Present"
            Name =    "Web-ISAPI-Filter"
        }

    WindowsFeature Web-Mgmt-Console {
            Ensure = "Present"
            Name =    "Web-Mgmt-Console"
        }

    WindowsFeature NET-Framework-45-ASPNET {
            Ensure = "Present"
            Name =    "NET-Framework-45-ASPNET"
        }

    WindowsFeature NET-WCF-HTTP-Activation45 {
            Ensure = "Present"
            Name =    "NET-WCF-HTTP-Activation45"
        }

    WindowsFeature RSAT-AD-PowerShell {
            Ensure = "Present"
            Name =    "RSAT-AD-PowerShell"
        }

    WindowsFeature WAS-Process-Model {
            Ensure = "Present"
            Name =    "WAS-Process-Model"
        }

    WindowsFeature WAS-Config-APIs {
            Ensure = "Present"
            Name =    "WAS-Config-APIs"
        }
  





#V4110
        Registry DisableIpSourceRouting {
            Ensure = "Present"
            Key = "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters"
            ValueName = "DisableIPSourceRouting"
            ValueData = "2"
            ValueType = "Dword"

        }
        #V4111
        Registry DisableICMPRedirect {
            Ensure = "Present"
            Key = "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters"
            ValueName = "EnableICMPRedirect"
            ValueData = "0"
            ValueType = "Dword"

        }
        #V4112
        Registry DisableRouterDiscovery {
            Ensure = "Present"
            Key = "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters"
            ValueName = "PerformRouterDiscovery"
            ValueData = "0"
            ValueType = "Dword"

        }
        #V4113
        Registry TCPKEEPAliveTime {
            Ensure = "Present"
            Key = "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters"
            ValueName = "KeepAliveTime"
            ValueData = "30000"
            ValueType = "Dword"
        }
        #V4116
        Registry NoNameReleaseOnDemand {
            Ensure = "Present"
            Key = "HKLM:\SYSTEM\CurrentControlSet\Services\Netbt\Parameters"
            ValueName = "NoNameReleaseOnDemand"
            ValueData = "1"
            ValueType = "Dword"
        }
        #V4438
        Registry TcpMaxDataRetransmissions {
            Ensure = "Present"
            Key = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
            ValueName = "TcpMaxDataRetransmissions"
            ValueData = "3"
            ValueType = "Dword"
        }

        #V4442
        Registry ScreenSaverGracePeriod {
            Ensure = "Present"
            Key = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
            ValueName = "ScreenSaverGracePeriod"
            ValueData = "0"
            ValueType = "String"
        }

        #V14232
        Registry NoDefaultExempt {
            Ensure = "Present"
            Key = "HKLM:\System\CurrentControlSet\Services\IPSEC"
            ValueName = "NoDefaultExempt"
            ValueData = "3"
            ValueType = "Dword"
        }

        #V21955
        Registry DisableIPSourceRoutingV6 {
            Ensure = "Present"
            Key = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
            ValueName = "DisableIPSourceRouting"
            ValueData = "2"
            ValueType = "Dword"
        }

        #V21956
        Registry TcpMaxDataRetransmissionsV6 {
            Ensure = "Present"
            Key = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
            ValueName = "TcpMaxDataRetransmissions"
            ValueData = "3"
            ValueType = "Dword"
        }

        #V4108
        Registry WarningLevelLog {
            Ensure = "Present"
            Key = "HKLM:\System\CurrentControlSet\Services\Eventlog\Security"
            ValueName = "WarningLevel"
            ValueData = "90"
            ValueType = "Dword"
        }
         
     

           #V-8324
        Registry NTPLog{
            Ensure = "Present"
            Key = "HKLM:\System\CurrentControlSet\Services\W32Time\Config"
            ValueName = "EventLogFlags"
            ValueData = "3"
            ValueType = "DWord"
        }
      

              #V3479
        Registry SetSafeDllSearchMode  {
            Ensure = "Present"
            Key = "HKLM:\System\CurrentControlSet\Control\Session Manager"
            ValueName = "SafeDllSearchMode"
            ValueData = "1"
            ValueType = "Dword"

            }


#Servivces Control
         

        Service Spooler{
            Name = "Spooler"
            StartupType = "Disabled"
            State = "Stopped"
        }
        Service Audiosrv{
            Name = "Audiosrv"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service AudioEndpointBuilder{
            Name = "AudioEndpointBuilder"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service Themes{
            Name = "Themes"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service TapiSrv{
            Name = "TapiSrv"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service PrintNotify{
            Name = "PrintNotify"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service ALG{
            Name = "ALG"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service AppMgmt{
            Name = "AppMgmt"
            StartupType = "Disabled"
            State = "Stopped"
        }


        Service DeviceAssociationService{
            Name = "DeviceAssociationService"
            StartupType = "Disabled"
            State = "Stopped"
        }


#Hyper V Services

    <#    Service vmickvpexchange{
            Name = "vmickvpexchange"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service vmicguestinterface{
            Name = "vmicguestinterface"
            StartupType = "Disabled"
            State = "Stopped"
        }


        Service vmicshutdown{
            Name = "vmicshutdown"
            StartupType = "Disabled"
            State = "Stopped"
        }


        Service vmicheartbeat{
            Name = "vmicheartbeat"
            StartupType = "Disabled"
            State = "Stopped"
        }


        Service vmicrdv{
            Name = "vmicrdv"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service vmictimesync{
            Name = "vmictimesync"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service vmicvss{
            Name = "vmicvss"
            StartupType = "Disabled"
            State = "Stopped"
        }
#>
        Service XblAuthManager{
            Name = "XblAuthManager"
            StartupType = "Disabled"
            State = "Stopped"
        }


        Service XblGameSave{
            Name = "XblGameSave"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service icssvc{
            Name = "icssvc"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service stisvc{
            Name = "stisvc"
            StartupType = "Disabled"
            State = "Stopped"
        }



        Service FrameServer{
            Name = "FrameServer"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service WalletService{
            Name = "WalletService"
            StartupType = "Disabled"
            State = "Stopped"
        }


        Service QWAVE{
            Name = "QWAVE"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service wlidsvc{
            Name = "wlidsvc"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service lfsvc{
            Name = "lfsvc"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service MapsBroker{
            Name = "MapsBroker"
            StartupType = "Disabled"
            State = "Stopped"
        }


        Service dmwappushservice{
            Name = "dmwappushservice"
            StartupType = "Disabled"
            State = "Stopped"
        }

        Service AJRouter{
            Name = "AJRouter"
            StartupType = "Disabled"
            State = "Stopped"
        }


        Service bthserv{
            Name = "bthserv"
            StartupType = "Disabled"
            State = "Stopped"
        }





      Service WerSvc{
            Name = "WerSvc"
            StartupType = "Automatic"
            State = "Running"
		}

		
		
	}
	
	
}
AzureMgmtPackPrep -computername $env:computername -verbose
Start-DscConfiguration -Path C:\Scripts\AzureMgmtPackPrep -ComputerName $env:computername -Verbose -Wait -Force




