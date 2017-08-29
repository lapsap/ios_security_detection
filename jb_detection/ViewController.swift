//
//  ViewController.swift
//  jb_detection
//
//  Created by Chris Tan on 22/08/2017.
//  Copyright © 2017 Chris Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fuck: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var bla = ""
        if (jb_detect()){
            bla += "is jb\n"
        }
        if (debug_detect()){
            bla += "is debug\n"
        }
        if (bla == ""){
            bla = "is ntg\n"
        }
        fuck.text = bla;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func debug_detect() -> Bool {
        
        var info = kinfo_proc()
        var mib : [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout<kinfo_proc>.stride
        let junk = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
        assert(junk == 0, "sysctl failed")
        return (info.kp_proc.p_flag & P_TRACED) != 0
    }
    
    func jb_detect() -> Bool{
        let la_path = ["/Applications/Cydia.app", "/Applications/blackra1n.app", "/Applications/FakeCarrier.app", "/Applications/Icy.app", "/Applications/IntelliScreen.app", "/Applications/MxTube.app", "/Applications/RockApp.app", "/Applications/SBSetttings.app", "/Applications/WinterBoard.app", "/private/var/lib/apt/", "/private/var/lib/cydia/", "/private/var/mobileLibrary/SBSettingsThemes/", "/private/var/tmp/cydia.log", "/private/var/stash/", "/usr/libexec/cydia/", "/usr/bin/sshd", "/usr/sbin/sshd", "/usr/libexec/cydia/", "/usr/libexec/sftp-server", "/Systetem/Library/LaunchDaemons/com.ikey.bbot.plist", "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist", "/Library/MobileSubstrate/MobileSubstrate.dylib", "/var/cache/apt/", "/var/lib/apt/", "/var/lib/cydia/", "/var/log/syslog", "/private/var/cache/apt/", "/private/var/lib/apt/", "/private/var/lib/cydia/", "/private/var/log/syslog", "/bin/bash", "/bin/sh", "/private/etc/apt/", "/etc/apt/", "/private/etc/ssh/sshd_config", "/etc/ssh/sshd_config", "/usr/libexec/ssh-keysign", "/Applications/Snoop-itConfig.app", "/Library/MobileSubstrate/DynamicLibraries/xCon.dylib", "/private/etc/dpkg/origins/debian", "/etc/apt", "/usr/bin/ssh", "/var/cache/apt", "/var/lib/apt", "/var/lib/cydia", "/var/tmp/cydia.log"]
        let fileManager = FileManager()
        for i in la_path{
            if fileManager.fileExists(atPath: i){
                return true;
            }
        }
 
        //
        let path = "/private/" + NSUUID().uuidString
        do {
            try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            try fileManager.removeItem(atPath: path)
            return true;
        } catch {}
        
        //
        let url = URL(string: "cydia://package/com.example.package")!
        if UIApplication.shared.canOpenURL(url) {
            return true;
        }
        return false;
    }
}

