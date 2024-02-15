## Steps to extract registry files from Access Data FTK Imager

1. **Open** Access Data FTK Imager 3.2.0.0.
2. **Click** on the "Add Evidence Item" button.
3. **Select** the "Logical Drive" radio button.
4. **Choose** the source drive.
5. **Scan** the Master File Table (MFT) by expanding the "Evidence Tree".
6. **Navigate** to the directory `windows/system32/config/`.
7. **Export** the registry file by clicking the "Export Files" button.
8. **Select** the destination folder for the exported file.

## Main issues faced when analyzing registry files

1. **Data Completeness**: The amount of information required depends on the investigation type. Ensuring data completeness is crucial as incomplete data can prolong the investigation and increase costs.

2. **Missing Data**: Missing data reduces the accuracy of the investigation. It can be categorized into three types of randomness:

   - Missing completely at random (MCAR)
   - Missing at random (MAR)
   - Missing not at random (MNAR)

3. **Extracting Data**: Current technology only allows for imaging of a registry file, not real-time viewing. This means investigators cannot collect further information after capturing the registry file.

4. **Lack of Knowledge About Keys**: Registry files store data with unique keys. Some investigators may not know all the keys stored in the registry files, leading to potential loss of information.

5. **Registry File Format**: Registry files are stored in the `C:drive/windows/system32/config/` file path and must be converted into a readable format before being used in an investigation.

## Main aspects of email forensic investigation

1. **Email Header Analysis**: This involves identifying sender, receiver, network path, MIME, email client information, time stamp, SMTP information, and encoding details from the email header. The analysis is done from bottom to top to obtain data in the order they occurred.

2. **Email Body Analysis**: This part of the analysis extracts hidden information communicated by users, such as URLs, RTF, HTML, etc., that are contained in the email body.

3. **Email Attachment Analysis**: Attachments are computer files containing data not included in the main body of the email. They can be text files, audio files, video files, images, or archive files. Analysis of attachments can reveal malware, pornographic content, or other illegal content distributed through the email.

## Email content analysis process using MailXaminer

1. **Mail View**: Previews the email message with properties like path, sender, receiver, Cc, Bcc, and subject.

2. **Hex View**: Shows the email content in hexadecimal value, helping to identify if any part of the email data has been tampered with.

3. **Property View**: Provides a summary of email attributes like message flags, recipient, sender details, etc.

4. **Message Header**: Provides all header-related information such as sender address, receiver address, MIME version, message ID, content type, Cc, Bcc, etc.

5. **MIME View**: Provides complete MIME details including the version, textual or non-textual attachment, and header information.

6. **Email Hop**: Helps to examine the path of the email journey including all gateways, routers, and switches through which the email had passed.

7. **HTML View**: Helps to analyze the internal script of the selected email in different views.

8. **RTF View**: Helps to identify any RTF formatting data available in the email.

9. **Attachment View**: Allows to preview the email attachment if any attachment is available within the email file.

## Web Browsers Forensics

- Web browsers are a valuable resource in forensic analysis due to the vast amount of information they contain.
- Artifacts found within browsers, such as navigation history and downloaded files, often help trace the source of incidents and malware.
- Understanding different browsers, where they store these artifacts, and how to extract and interpret them is crucial in forensic analysis.

## Common Artifacts

- **Navigation History**: Websites visited by the user.
- **Autocomplete Data**: Search terms suggested by the browser based on user's frequency.
- **Bookmarks**: Websites saved by the user for later access.
- **Extensions and Addons**: Additional features or tools installed by the user on the browser.
- **Cache**: Temporary files (images, scripts, etc.) downloaded by the browser to improve loading speed.
- **Logins**: Usernames and passwords stored by the browser for convenience.
- **Favicons**: Small icons associated with websites that appear on tabs, URLs, bookmarks, etc.
- **Browser Sessions**: Information about the current or previous state of the browser, such as open tabs, windows, etc.
- **Downloads**: Files downloaded by the user through the browser.
- **Form Data**: Data entered by the user in online forms, such as name, email, address, etc.
- **Thumbnails**: Small images that represent the content of websites or files.
