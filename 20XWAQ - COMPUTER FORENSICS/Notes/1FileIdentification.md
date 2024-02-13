## What is signature analysis?

A signature analysis is a process where files, their headers and extensions are compared with a known database of file headers and extensions in an attempt to verify all files in the storage media and discover those which may be hidden.

## The structure of a file

- **Filename**: A unique identifier that tells the computer and the user what the file is called and what format it has. The format is indicated by the extension, such as .doc or .pdf.

- **File header/footer**: The information that describes the type of the file and the application that created it. This is also called the file signature and it is usually unique for each file type. The file signature can be viewed using a hex editor, such as HexEdit, and compared with a list of known signatures to identify the file type.

- **File content**: The data that is stored in the file for different applications. The data may be encoded in various ways, depending on the file format and the application. Only compatible applications can read and extract the file content.

## Data hiding methods

1. **Changing filename extensions**: When the criminal doesn't want to delete data, a method to hide one file as another is by altering the file extension or in Windows, merging different files using a command prompt. This can fool the operating system to display the file as a different type, but the original file can be retrieved by changing the extension back.

2. **Deleting data**: When the criminal original intention was to delete and destroy the data, they might try to hide data by deleting the file, which does not actually erase the data from the disk, but only marks the space as available for reuse. The data can remain on the disk until overwritten by new data.

```
EnCase is an application that can fully automate file signature analysis.
```

## Uses of File Signature Analysis:

- **Detecting mismatches**: Comparing the file signature with the file extension to spot any discrepancies or tampering. For example, a file with a .jpg extension but a .pdf signature is suspicious.
- **File carving**: Searching for file signatures on a disk to recover deleted or hidden files. For example, a file with a .pdf signature but no file name or extension can be carved out and restored.

## Weakness of File Signature Analysis

It depends on the completeness and accuracy of the list of predefined file signatures, which may not cover all possible file types or formats. This may lead to missing or ignoring important files or evidence.
