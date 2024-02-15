## Using partition recovery to recover files from unallocated space

    A tool called MiniTool Partition Wizard is used for the demo in the material.

Steps to recover files from unallocated space using MiniTool Partition Wizard:

1. **Launch MiniTool Partition Wizard**: Start the application and select the 'Partition Recovery' feature from the toolbar. This step initiates the recovery process.

2. **Start Partition Recovery Wizard**: A pop-up window will appear. Click 'Next' to proceed. This step guides you through the recovery process.

3. **Choose Target Disk**: Select the disk where the partition has become unallocated, then click 'Next'. This step identifies the location of the lost data.

4. **Select Scanning Range**: Choose between 'Full Disk', 'Unallocated Space', or 'Specified Range' based on your needs. 'Full Disk' scans the entire disk, 'Unallocated Space' scans only the free space, and 'Specified Range' scans specific sectors (within an LBA range).

5. **Choose Scanning Method**: Select either 'Quick Scan' or 'Full Scan'. 'Quick Scan' is faster and jumps to the end of the partition once it finds a lost/deleted partition, while 'Full Scan' scans each sector of the specified scanning range and is more thorough.

6. **Select Partitions to Recover**: In the pop-up window, choose all the partitions you need to recover. Click 'Finish' to return to the main interface. This step ensures that all necessary data is recovered.

7. **Assign Drive Letter**: The recovered partition won't have a drive letter, so you need to assign one. Select the partition, click 'Change Drive Letter' from the 'Partition Management' menu, and select a new letter from the drop-down list. This step makes the recovered data accessible in Windows Explorer.

8. **Apply Changes**: Click the 'Apply' button to make all operations effective. You can now access all recovered partitions and data in Windows Explorer. This step finalizes the recovery process.

## Use Data Recovery to Recover Files from Unallocated Space

Steps to recover files from unallocated space using MiniTool Partition Wizard's Data Recovery feature:

1. **Launch MiniTool Partition Wizard**: Start the application and click 'Data Recovery' in the toolbar.

2. **Select Target Disk**: Choose the lost/deleted partition or the disk with unallocated space and click 'Scan'. You can click 'Settings' before scanning to specify file types and file systems to scan.

3. **Wait for Scan to Complete**: The software will scan your target drive. This may take some time, so be patient.

4. **Select Files to Recover**: After the scan, all possible partitions will be displayed. Unfold the partitions to find your files. Use features like 'Show Lost Files', 'Filter', and 'Type' to help find your files. Check the files you want to recover and click 'Save' to store them on another hard drive.

It's not recommended to save recovered files to their original location to avoid data overwriting. This process should help you recover files from unallocated space effectively.

## After recovering files from unallocated space

Steps to create a new partition with unallocated space using MiniTool Partition Wizard:

1. **Select Unallocated Space**: Click on the unallocated space and select 'Create Partition' from the 'Partition Management' menu in the left pane. Alternatively, you can right-click and choose 'Create' from the context menu.

2. **Specify Partition Details**: In the new window, specify the partition size, location, file system, drive letter, and other details as needed. Click 'OK' to return to the main interface.

3. **Apply Changes**: Click 'Apply' to execute the changes. This will create a new partition in the unallocated space.

## Reasons for partition loss

Partition loss can occur due to several reasons:

1. **Virus Attack**: Viruses can attack your computer and lead to disk partition loss.
2. **System Crash**: If there are issues with your computer, a system crash can occur, leading to disk partition loss.
3. **System Upgrade**: Sometimes, a partition may get lost after an OS update.
4. **Sudden Power Outage**: If your computer suddenly loses power, your disk may show as unallocated.
5. **Wrong Deletion**: Accidental deletion of a partition can occur when managing your disk or partition.

In addition, factors like bad sectors and damaged partition tables can also cause partition loss.

When a hard drive becomes unallocated, all data on it will be missing. If there's no important data on the partition, you can create a new partition with the unallocated space. However, if you need to recover files from the unallocated space, you can use tools like MiniTool Partition Wizard. This tool allows you to recover lost or deleted partitions and files from unallocated space on various storage devices. Remember, it's not recommended to save recovered files to their original location to avoid data overwriting.

## File carving and common techniques

File carving is a recovery technique that focuses on the contents and structures of files, rather than relying on file system structures or other metadata. It's particularly useful when such metadata is missing or corrupted. The most common file carving techniques are:

1. **Header-Footer or Header-Maximum File Size Carving**: This technique recovers files based on known headers and footers, or a maximum file size if the file format has no footer. For example, JPEG files have a `\xFF\xD8` header and `\xFF\xD9` footer.

2. **File Structure-Based Carving**: This technique uses the internal layout of a file, including elements like headers, footers, identifier strings, and size information.

3. **Content-Based Carving**: This technique is used when the content structure is loose (like MBOX, HTML, XML). It relies on content characteristics such as character count, text/language recognition, white and black listing of data, statistical attributes (Chi^2), and information entropy.

```
Scalpel, FTK and EnCase are some of the many tools widely used for file carving.
```

## Simple file carving using a hex editor

File carving is a process used in computer forensics to extract data without the assistance of the file system metadata. It is used to recover files from unallocated space using their headers and footers. Here's how you can perform simple file carving using a hex editor:

1. **Open the File in Hex Editor**: Open the file from which you want to carve the data in a hex editor.

2. **Locate the Header**: Search for the header of the file type you want to carve. For example, a JPEG file starts with `FFD8FFE0`.

3. **Locate the Footer**: Similarly, search for the footer of the file type. For a JPEG file, it ends with `FFD9`.

4. **Select the Data Block**: Once you have the header and footer, select the entire block of data starting from the header and ending at the footer.

5. **Copy the Data Block**: Copy the selected block of data.

6. **Create a New File**: Start a new file in the hex editor and paste the copied data into this new file.

7. **Save the New File**: Save the new file with an appropriate name and extension. For example, if you're carving a JPEG image, you might name it `recovered_image.jpg`.

This process allows you to recover files from unallocated space or even from within other files. It's a basic technique in file carving and doesn't require any specialized carving tools.

---

## What is Windows Registry?

The Windows Registry is a database that stores configuration information about users, hardware, and software on a Windows system. It's designed to configure the system but also tracks user activities, connected devices, and software usage, making it useful for forensic investigations.

The registry contains root folders known as 'hives'. There are five main registry hives:

1. **HKEY_USERS**: Contains all the loaded user profiles.
2. **HKEY_CURRENT_USER**: Contains the profile of the currently logged-on user.
3. **HKEY_CLASSES_ROOT**: Contains configuration information on the applications used to open files.
4. **HKEY_CURRENT_CONFIG**: Contains the hardware profile of the system at startup.
5. **HKEY_LOCAL_MACHINE**: Contains configuration information including hardware and software settings.

Understanding the structure and function of the Windows Registry can be key to tracking the 'who', 'what', 'where', and 'when' in a forensic investigation. The key to using the registry for such purposes is knowing where to look.

## Structure of the Windows Registry

The Windows Registry is structured similarly to the Windows directory/subdirectory structure. It consists of five root keys or ‘hives’, each containing subkeys and possibly sub-subkeys. These subkeys have descriptions and values that are often binary (0 or 1), but can also contain more complex information displayed in hexadecimal.

## Accessing the Windows Registry

To access the registry on your own system, you can use the built-in Windows utility ‘regedit’. Simply type ‘regedit’ into the search window and click on it to open the registry editor. This allows you to view and modify the registry structure and values. However, caution should be exercised when making changes to the registry due to its critical role in system configuration.

## Windows Registry Forensics

1. **Network List Profiles**: The registry at `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles` contains a list of GUIDs of wireless access points the machine has been connected to, including the SSID name and the date last connected.

2. **Recent Documents**: The `RecentDocs` key at `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs` tracks the most recent documents used or opened on the system by file extension.

3. **Typed URLs**: When a URL is typed in Internet Explorer, this value is stored in the registry at `HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs`.

4. **IP Addresses of User Interfaces**: The registry at `HKEY_LOCAL_MACHINE\System\Services\CurrentControlSet\services\Tcpip\Parameters\Interfaces` tracks each interface's IP address and related information.

5. **Start Up Locations**: Information about applications or services set to start when the system starts can be located in the registry at `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run`.

6. **RunOnce Startup**: If the software is set to run once at startup, the subkey may be set at `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce`.

7. **Start Up Services**: The key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services` lists all the services set to start at system startup.

8. **Start Legacy Applications**: When legacy 16-bit applications are run, the program listed is run at `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\WOW`.

9. **Start When a Particular User Logs On**: In the key `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run`, the values are run when the specific user logs in.

10. **Storage Artifacts**: Traces of evidence of storage devices can be found within the registry at `HK_Local_Machine\System\ControlSet00x\Enum\USBSTOR` and `HKEY_LOCAL_MACHINE\System\MountedDevices`.

This is a high-level overview of how the Windows Registry can be used in forensic investigations to track user activity and detect malicious software.
