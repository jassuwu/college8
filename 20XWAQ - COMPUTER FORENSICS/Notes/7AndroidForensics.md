# Procedures for Handling an Android Device

## Introduction

Forensic analysts face the challenge of establishing a protocol for handling Android devices before taking direct custody. This is not a new issue as other digital devices such as computers or laptops may also be handled by others involved in the investigation. However, mobile devices are relatively new and often not handled properly by first responders, leading to data modification and potential loss of access to the device.

## Securing the Device

Many agencies and first responders have established protocols for securing evidence. The following sections are meant to complement, not replace, these existing procedures. These represent special procedures, and educating first responders who have many other responsibilities can be challenging.

### Pass Code Procedures

Pass code locked devices are becoming more common due to heightened security awareness in consumers and corporations. The first consideration when obtaining information from a device is whether an opportunity exists to immediately disable or otherwise circumvent the pass code. If you encounter an Android device and the screen is active, strong consideration should be given to checking and potentially changing its settings.

For devices that have pass codes, there is a short period of time (from less than a minute up to about 15 min) where full access to the device is possible without re-entering the pass code. If a device is in this state, there are several steps to consider:

1. **Increase the screen timeout**: This prevents or postpones the screen locking. The location for this setting is not consistent between Android versions and devices. For example, on some devices the timeout can be set by pressing Menu (from the home screen), then Settings, Sound & display, Screen timeout, and then select “Never timeout.” On other devices, press Menu (from the home screen), then Settings, Security, Lock phone after, and then finally “15 minutes.” As long as the device has some nominal activity in the allotted timeout setting, it will remain accessible.

2. **Enable USB debugging and “Stay awake” settings**: The location for this setting has remained consistent in devices and can be accessed from the USB debugging settings and Stay awake. If you select the “Stay awake” setting and then connect it to a charge, the device will never go to sleep, which is effective in preventing the screen lock. By enabling USB debugging, the device can be accessed over USB enabling data extraction.

These steps are making changes to the device and should be thoroughly logged in the case notes describing the state of the device, the rationale for the attempted changes, and the outcome of each change. This will not only assist in future report writing but will likely be an important factor if your decision to change the device is challenged in court.

To make matters more difficult, it is also important to minimize touching the screen in case the screen lock becomes active. As we will discuss shortly, it is sometimes possible to determine the pattern lock of a device by enhancing photographs of the device’s screen. The lesser the interaction a first responder has with the screen, the higher the success rate of this technique.

### Network Isolation

**Importance of Network Isolation**

It is crucial to isolate the device from the network as soon as possible. In the worst-case scenario, a remote wipe could be initiated on the device which, if successful, would prevent the recovery of any data. While most remote wipes are done over the data network, some can be triggered over SMS, hence it's essential to ensure the device is fully isolated to prevent remote wipes. In other circumstances, additional messages on the device could be received or even removed by triggers outside your control. As the goal of a forensic image is to preserve the state of the device for additional analysis, any changes should be avoided.

**Techniques for Device Isolation**

There are several ways to isolate a device from the network, each with its own advantages and disadvantages. The best option is probably placing the device in Airplane mode. This varies slightly between Android devices and versions but the general approach is the same:

1. Press and hold the Power off button and select Airplane mode.
2. Press Menu (from the home screen), then Settings, then the Wireless option which is generally near the top. Some examples are “Wireless controls” or “Wireless and networks.” The next menu should present the Airplane mode option.

Regardless of which technique you ultimately choose, the main goal should be to isolate the device from the network as soon as possible.

**Summary of Techniques for Device Isolation**

| Technique                                                                                      | Advantages                                                                                                                                         | Disadvantages                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Put the device in Airplane mode. This requires that you have full access to the Settings menu. | The device continues running and temporal data remains intact. Disables cellular data network as well as Wi-Fi.com.                                | You are modifying the device setting further. Only works if you have full access to the device.                                                                                                                                                                                                                                                                                                                                              |
| If the phone is a GSM phone, remove the SIM card.                                              | Easy to remove, effective in disabling all cellular voice, SMS, and data transmissions.                                                            | Does not disable Wi-Fi.com or other networks. Does not work on non-GSM phones including CDMA and iDEN phones.                                                                                                                                                                                                                                                                                                                                |
| Suspend account with wireless carrier.                                                         | Effective in disabling all cellular voice, SMS, and data transmissions for any phone.                                                              | Process may take some time and require a court order. Does not disable Wi-Fi.com or other networks.                                                                                                                                                                                                                                                                                                                                          |
| Place device in a shielded bag, box, tent, or room.                                            | Faraday shields prevent various types of network transmissions and can be an effective approach if you cannot utilize any of the previous options. | There is some debate about the effectiveness of portable Faraday shields, notably Faraday bags. Also, while the transmissions are blocked, the device attempts to contact the cellular network repeatedly thus draining the battery quickly. Cords cannot be inserted into the enclosure as they will transmit signals. A shielded room dedicated for mobile examinations is ideal. However, they are quite expensive to build and maintain. |
| Turn the device off.                                                                           | Completely effective in preventing all network transmissions.                                                                                      | The device state is modified and temporal data is lost. Pass code on reboot could be enabled, thus restricting access to the device.                                                                                                                                                                                                                                                                                                         |

### Powered-off Devices

If a device is already powered off when you encounter it, the best option is to boot it into recovery mode to test for connectivity and root access. The owner may have already enabled USB debugging or have rooted the device, so you may have access to the data without booting into normal operational mode.

This approach is similar to performing forensics on a standard computer hard drive. The last thing any trained forensic analyst would do is boot the computer to determine what operating system is installed. Instead, the hard drive is removed and connected to a write blocker for imaging to prevent any changes to the evidence.

Similarly, if a mobile device does not have to boot into normal mode, there is no need to do so as this may make changes to the device.

# How to Circumvent the Pass Code

## Types of Pass Codes

Android devices currently support three types of pass codes:

1. **Pattern Lock**: This was the default on the initial Android devices. To access the device, the user draws a pattern on the locked phone and, if drawn properly, the device is unlocked.

2. **Personal Identification Number (PIN)**: This is a simple numeric code which is commonly found on other mobile devices.

3. **Alphanumeric Code**: This is a full, alphanumeric code. The most effective pass code is one that allows or requires an alphanumeric password, as these are far more difficult to circumvent.

## Techniques to Circumvent Pass Codes

### Utilize ADB if USB Debugging is Enabled

The first technique you should attempt, provided the phone is powered on, is to connect with the Android Debug Bridge (ADB) over USB. Whereas only a fraction of Android devices will allow an ADB connection through the USB debugging setting, it is certainly worth trying as it easily provides sufficient access for data extraction. The most common reasons for which users enable USB debugging include:

- App development and testing
- Certain apps require this setting, such as PDAnet, which allows the device to provide Internet access to a tethered device over USB
- Custom ROMs
- Developer phones such as Google’s Android developer phone (ADP1)
- Device hacking

If the USB debugging is enabled, a forensic analyst can use the interface to gain access and perform a logical recovery of the device.

### Smudge Attack

Initially, Android devices used the pattern lock for pass code protection instead of a numeric or alphanumeric code. A recent paper entitled “Smudge Attacks on Smartphone Touch Screens” by the University of Pennsylvania Department of Computer and Information Science demonstrated a technique for accessing pattern locked Android devices by enhancing photographs of the screen. The paper’s summary states:

"Our photographic experiments suggest that a clean touch screen surface is primarily, but not entirely, reflective, while a smudge is primarily, but not entirely, diffuse. We found that virtually any directional lighting source that is not positioned exactly at a complementary angle to the camera will render a recoverable image of the smudge. Very little photo adjustment is required to view the pattern, but images generally rendered best when the photo capture was overexposed by two to three f-stops (4 to 8 times “correct” exposure)."

If care was taken by the first responders to minimize contact with the device’s screen, this recovery technique may be viable.

### Recovery Mode

Some users install a custom ROM which usually enables root access to the device through a modified recovery mode. Most custom ROMs install a modified recovery partition which simplifies the process used to install the custom ROM. There are several popular recovery partitions that are primarily used with custom ROMs and both offer shell access with root privileges from within the recovery console itself.

As the phone is not booted into normal mode, the pass code is circumvented and the user data partitions can be mounted read-only, thus preventing changes to that area. Forensic analysts should attempt to boot into recovery mode if the device is powered off when they take custody. If, instead, the device is running and a pass code is present, you should first attempt to connect via ADB and consider smudge attack. If neither of these is successful, you should then try to reboot into recovery mode.

Like many other techniques, recovery mode is accessed in different ways depending on the device manufacturer and model. Once in recovery mode, you can connect the device to your Ubuntu workstation and attempt to connect using ADB. If the device is running a nonmodified recovery mode, the connection will fail.

### Screen Lock Bypass App

Security researcher Thomas Cannon recently developed a technique that allows a screen lock bypass by installing an app through the new web-based Android Market. Cannon’s technique utilizes a new feature in the web-based Android Market that allows apps to be installed directly from the web site.

As such, you must have access to the Android Market using the primary Gmail user name and password for the device, which may be accessible from the primary computer of the user. Alternatively, you could access the Android Market if you knew the user name and password and had sufficient authority. Changing the user’s Gmail password would not work in this instance.

Cannon explains the technique as follows:

The procedure is quite simple really. Android sends out a number of broadcast messages which an application can receive, such as SMS received or Wi-Fi.com disconnected. An application has to register its receiver to receive broadcast messages and this can be done at run time, or for some messages, at install time. When a relevant message comes in, it is sent to the application and if the application is not running it will be started automatically.

After testing out various broadcast messages the best one found for the purpose of this utility was android.intent.action.PACKAGE_ADDED. This exists in all APIs as version 1 and is triggered when an application is installed. Hence, to get the application to execute remotely, we first deploy it from the Android Market, then deploy any other application that will cause the first one to launch.

Once launched it is just a matter of calling the disableKeyguard() method in KeyguardManager. This is a legitimate API to enable applications to disable the screen lock when, say, an incoming phone call is detected. After finishing the call the app ought to enable the screen lock again, but we just keep it disabled.

This technique is certainly worth consideration if you have proper access to the Android Market.

### Use Gmail User/Pass

On most Android phones, you can circumvent the pass code if you know the primary Gmail user name and password registered with the device. After a number of failed attempts (ten attempts on the G1), you will be presented with a screen that asks if you forgot your pass code. From there, you can enter the Gmail user name and password and you will then be prompted to reset the pass code. This technique does not require the phone to be online as it uses credential information cached on the phone.

If you do not have the current Gmail user name and password, but have sufficient authority (i.e., court order) to reset the password, you could attempt to compel Google to reset the account password. You would then have to connect the Android device to the network and gain access. This issue presents many challenges, including the need to place the device online, putting it at risk for remote wipe in addition to making changes to the device. Reports on various law enforcement mailing lists indicate this technique does not always work.

If this approach is attempted, additional research is warranted. In particular, it would be prudent to control the Internet connection the device uses, most likely a Wi-Fi.com access point. You could then limit the network access to only those which the Google server needed for authentication. In addition, a detailed network capture of test devices should be analyzed as well as the actual changes made to the device.

### JTAG and Chip-off

At this time, most Android devices do not encrypt the contents of the NAND flash, which makes directly accessing and decoding the memory chips a potential workaround if a pass code is enabled. There are two primary techniques, which provide direct access to the chips. Both are technically challenging. The two techniques are:

1. **Joint Test Action Group (JTAG)**: With JTAG, you connect directly to the device’s CPU by soldering leads to certain JTAG pads on the printed circuit board (PCB). Then JTAG software can be used to perform a complete binary memory dump of the NAND flash, modify certain partitions to allow root access, or eliminate the pass code altogether.

2. **Physical Extraction (Chip-off)**: In the chip-off procedure, the NAND flash chips are physically extracted from the PCB using heat and air. The chip, usually a small ball grid array (BGA) package, then needs to have the BGA connections regenerated and inserted into special hardware that connects to the chip and reads the NAND flash.

Both techniques are not only technically challenging and require partial to full disassembly of the device, but they require substantial post-extraction analysis to reassemble the file system. For these reasons, JTAG and chip-off would likely be the very last choices to circumvent a locked device. The advantages to these techniques are that they will work in any situation where the NAND flash is not encrypted. However, extensive research, development, testing, and practice are required to execute these techniques.

# Logical Techniques

## ADB Pull

ADB Pull is a command-line tool that is part of the Android SDK. It allows for the extraction of data from an Android device, and it's often used in forensic analysis. Here's a summary of its usage and effectiveness:

### Usage

The `adb pull` command is used to copy various parts of the file system to a workstation for further analysis. The command requires shell permissions to run, which means that some files may not be accessible if the device does not have root access or is not running a custom ROM. However, there are still files that can be accessed.

For example, on non-rooted devices, an `adb pull` can still access useful files such as unencrypted apps, most of the tmpfs file systems that can include user data such as browser history, and system information found in “/proc,” “/sys,” and other readable directories.

On rooted devices, a pull of nearly all directories is quite simple and certain files and directories from “/data” would be of interest.

When utilizing the physical technique, it is not always possible to mount some acquired file systems such as YAFFS2. If `adbd` is running with root permissions, you can quickly extract a logical copy of the file system with `adb pull`.

### Effectiveness

The effectiveness of the `adb pull` command depends on the privileges it has. If you have root privileges, this method is very simple and effective. For instance, the entire “/data” partition can be copied to a local directory in just over three and a half minutes. The directory structure is maintained during the copy, so you can then simply browse or otherwise analyze the files of interest from the workstation.

However, as most phones will not have root access (at least by default), this technique may appear to be of little value. But it's a powerful utility to understand and there are several scenarios ideal for this approach.

In conclusion, `adb` is not only a free utility in the Android SDK but also very versatile, making it one of the primary logical tools used on an Android device for forensic purposes.

## Backup Analysis

Backup analysis is a crucial part of Android forensics. When Android was first released, it did not provide a mechanism for users to backup their personal data. As a result, a number of backup applications were developed and distributed on the Android Market. For users running custom ROMs, there was an even more powerful backup utility developed called nandroid.

### Popular Backup Apps

One of the more popular backup apps is RerWare’s My Backup Pro which can take a backup of device data using Content Provider and even the entire “/data/data” files if the device has root access. The user can choose between saving to the SD card and saving to RerWare’s server. The app supports the following:

- Application install files (if phone has root access, this includes APK + Data and Market Links)
- Contacts
- Call log
- Browser bookmarks
- SMS (text messages)
- MMS (attachments in messages)
- System settings
- Home screens (including HTC Sense UI)
- Alarms
- Dictionary
- Calendars
- Music playlists
- Integrated third-party applications

Interestingly, the app runs not only on Android but also on Windows Mobile, Blackberry, and soon Symbian OS. The user can take a backup on one platform and restore on a completely different supported OS. RerWare saves a single SQLite file to the SD card when the device backup is stored locally.

### New Backup API

In the more recent releases of Android, a new backup API is now available. Developers can simply integrate these APIs into their apps and the rest of the backup is handled by Android and Google. This provides the users with secure, cloud-based backups with consistency across apps, and will likely become the de facto standard.

### Importance of Backup Analysis

Regardless of the backup app, forensic analysts should determine if one was installed and, if so, where the backup data is stored. The SD card should be examined as well as other devices such as a computer or laptop. The data saved in a backup is obviously of significant value in an examination.
