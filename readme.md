# IOS Jailbreak Detection && Debugging Detection

## Intro
Code is inside ViewController.swift.
There are 2 Boolean functions ( debug_detect() , jb_dectect() )

### Jailbreak Detection Methods
1. Check if file or directory exits from our list
2. Try to write to private 
3. try to connect to cydia url

#### Jailbreak checklist
```
   "/Applications/Cydia.app"
   "/Applications/blackra1n.app"
   "/Applications/FakeCarrier.app"
   "/Applications/Icy.app"
   "/Applications/IntelliScreen.app"
   "/Applications/MxTube.app"
   "/Applications/RockApp.app"
   "/Applications/SBSetttings.app"
   "/Applications/WinterBoard.app"
   "/private/var/lib/apt/"
   "/private/var/lib/cydia/"
   "/private/var/mobileLibrary/SBSettingsThemes/"
   "/private/var/tmp/cydia.log"
   "/private/var/stash/"
   "/usr/libexec/cydia/"
   "/usr/bin/sshd"
   "/usr/sbin/sshd"
   "/usr/libexec/cydia/"
   "/usr/libexec/sftp-server"
   "/Systetem/Library/LaunchDaemons/com.ikey.bbot.plist"
   "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"
   "/Library/MobileSubstrate/MobileSubstrate.dylib"
   "/var/cache/apt/"
   "/var/lib/apt/"
   "/var/lib/cydia/"
   "/var/log/syslog"
   "/private/var/cache/apt/"
   "/private/var/lib/apt/"
   "/private/var/lib/cydia/"
   "/private/var/log/syslog"
   "/bin/bash"
   "/bin/sh"
   "/private/etc/apt/"
   "/etc/apt/"
   "/private/etc/ssh/sshd_config"
   "/etc/ssh/sshd_config"
   "/usr/libexec/ssh-keysign"
   "/Applications/Snoop-itConfig.app"
   "/Library/MobileSubstrate/DynamicLibraries/xCon.dylib"
   "/private/etc/dpkg/origins/debian"
   "/etc/apt"
   "/usr/bin/ssh"
   "/var/cache/apt"
   "/var/lib/apt"
   "/var/lib/cydia"
   "/var/tmp/cydia.log"
```
