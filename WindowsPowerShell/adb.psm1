# ADB PowerShell Aliases

$env:PATH += ";$home\Documents\Tools\adb"

function adb-r($name) {adb uninstall --user 0 $name}

function doit { adb shell settings put global hide_gesture_line 1 }
function doit-smg { adb shell pm grant com.draco.immersive android.permission.WRITE_SECURE_SETTINGS }

function rm-mi-bloat ($name) {
    $packages = @(
        "com.android.bipscom.android.emergency",                    # Android Print Service / Emergency services (possibly misjoined)
        "com.google.android.feedback",                              # Google Feedback
        "com.google.android.youtube",                               # YouTube
        "com.google.android.googlequicksearchbox",                  # Google App (Search/Assistant)
        "com.google.android.videos",                                # Google Play Movies & TV
        "com.google.android.contacts",                              # Google Contacts
        "com.google.android.apps.safetyhub",                        # Google Safety & Emergency Hub
        "com.google.android.cellbroadcastreceiver",                 # Cell Broadcast Receiver
        "com.google.android.cellbroadcastreceiver.overlay.miui",    # Cell Broadcast Receiver (MIUI overlay)
        "com.google.android.cellbroadcastservice",                  # Cell Broadcast Service
        "com.google.android.cellbroadcastservice.overlay.miui",     # Cell Broadcast Service (MIUI overlay)
        "com.google.android.apps.subscriptions.red",                # Google One
        "com.google.android.marvin.talkback",                       # Android Accessibility Suite (TalkBack)
        "com.google.android.partnersetup",                          # Google Partner Setup
        "com.mediatek.mdmconfig",                                   # MediaTek MDM Config (Device Management)
        "com.google.android.apps.nbu.paisa.user",                   # Google Pay (India)
        "com.google.android.apps.chromecast.app",                   # Google Home
        "com.google.android.apps.tachyon",                          # Google Meet / Duo
        "com.netflix.mediaclient",                                  # Netflix
        "com.google.android.apps.magazines",                        # Google Newsstand (Deprecated)
        "com.google.android.youtube.music",                         # YouTube Music
        "com.google.android.apps.youtube.music",                    # YouTube Music
        "com.miui.backup",                                          # MIUI Backup
        "com.miui.bugreport",                                       # MIUI Bug Reporting
        "com.miui.analytics",                                       # MIUI Analytics (Data Collection)
        "com.mfashiongaller.emag",                                  # Mi Store / eMag (Unknown specific app)
        "com.mi.android.globalpersonalassistant",                   # MIUI Smart Assistant
        "com.miui.cleaner",                                         # MIUI Cleaner
        "com.miui.cloudbackup",                                     # MIUI Cloud Backup
        "com.miui.daemon",                                          # MIUI Daemon (System Monitoring)
        "com.miui.cloudservice",                                    # MIUI Cloud Service
        "com.miui.fmservice",                                       # MIUI Find Device / FM Service
        "com.miui.guardprovider",                                   # MIUI Security App Provider
        "com.miui.micloudsync",                                     # MIUI Cloud Sync
        "com.miui.miservice",                                       # MIUI Services & Feedback
        "com.xiaomi.joyose",                                        # Xiaomi Performance Tracking / Sensor Data (Joyose)
        "com.miui.msa.global",                                      # MIUI System Ads (MSA)
        "com.xiaomi.calendar",                                      # Xiaomi Calendar
        "com.xiaomi.payment",                                       # Xiaomi Payment / Mi Pay
        "com.xiaomi.xmsfkeeper"                                     # Xiaomi Messaging Service Framework Keeper

    )

    foreach ($package in $packages) {
        Write-Host "Uninstalling package: $package"
        & adb uninstall --user 0 $package
    }
}

function rm-sm-bloat ($name) {
    $packages = @(
        "com.google.android.apps.googleassistant",           # Google Assistant
        "com.samsung.ecomm.global.in",                       # Samsung Shop / Samsung e-Store (India)
        "com.rsupport.rs.activity.rsupport.aas2",            # RSUPPORT Remote Support
        "come.google.android.apps.youtube.music",            # (Typo?) Possibly meant to be YouTube Music
        "com.google.android.apps.youtube.music",             # YouTube Music
        "com.samsung.android.app",                           # Samsung App (Generic/System)
        "com.samsung.android.app.tips",                      # Samsung Tips
        "com.google.android.apps.restore",                   # Google Device Restore Tool
        "com.google.android.apps.bard",                      # Google Bard
        "com.microsoft.appmanager",                          # Microsoft App Manager
        "com.google.android.apps.tachyon",                   # Google Duo / Meet
        "com.google.android.apps.messaging",                 # Google Messages
        "com.facebook.services",                             # Facebook Services
        "com.mygalaxy",                                      # Samsung My Galaxy (India)
        "com.android.hotwordenrollment.okgoogle",            # Google Hotword Enrollment (OK Google)
        "com.microsoft.skydrive",                            # Microsoft OneDrive
        "com.sec.android.easyMover",                         # Samsung Smart Switch (Main App)
        "com.sec.android.easyMover.Agent",                   # Samsung Smart Switch Agent
        "com.samsung.android.service.stplatform",            # Samsung SmartThings Platform
        "com.google.android.cellbroadcastreceiver",          # Google Emergency Alerts
        "com.google.android.youtube",                        # YouTube
        "com.samsung.android.app.spage",                     # Samsung Free / Bixby Home
        "com.samsung.android.mdx"                            # Samsung Multi-Device eXperience (Link to Windows)

    )

    foreach ($package in $packages) {
        Write-Host "Uninstalling package: $package"
        & adb uninstall --user 0 $package
    }
}

im man
