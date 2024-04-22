## Imaging vs. Cloning

Here's a comparison table that differentiates between Disk Imaging and Disk Cloning in the context of Computer Forensics:

| Criteria          | Disk Imaging                                                                                                                             | Disk Cloning                                                                                                         |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Definition**    | Disk imaging creates an exact mirror image of your hard disk drive (HDD), including the information needed to boot the operating system. | Disk cloning creates an exact, uncompressed copy of your entire drive or specific partitions on your drive.          |
| **Format**        | The image remains in the form of a compressed file.                                                                                      | Because disk clones are not compressed, they can be instantly replicated to a destination backup drive or the cloud. |
| **Modifiability** | Disk images are petrified and in their image format cannot be modified.                                                                  | Clones are working snapshots, that are modifiable.                                                                   |
| **Use Cases**     | Disk imaging is primarily used for forensic analysis and to preserve original data.                                                      | Disk cloning is used to create working copies or exact replacement drives.                                           |

In summary, while both processes involve creating an exact copy of the data, the key difference lies in their use cases. Disk imaging is typically used for data preservation and forensic analysis, while disk cloning is used to create working copies or replacement drives.

## Triaging

In computer forensics, triaging is the process of prioritizing digital evidence collected from a crime or investigation. It helps determine the scope of the investigation, and manage digital evidence effectively.

## Disk duplicator

A disk duplicator, also known as a forensic duplicator, is a tool used in computer forensics investigations. It creates an exact copy of a storage device, preserving the integrity of the original data. This process is sometimes referred to as bitwise duplication, sector copying, or physical imaging

Different options:

- Disk to disk
- Disk to file
- File to disk
- File to file

Need destination size > source size. Maybe use trimming.

## One line definitions

- **Cloning**: bit by bit copying
- **Imaging**: replica of disk/drive
