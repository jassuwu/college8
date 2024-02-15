## Steps to use Wireshark for network traffic analysis

1. **Download and Install Wireshark**: Wireshark is available for multiple platforms (Windows, Linux, Unix, etc). Ensure to install the version compatible with your operating system. Wireshark requires either Winpcap (Windows) or libpcap (Linux) library files.

2. **Packet Capture**: After installing, start Wireshark and select the network interface you want to capture packets from. Wireshark will begin capturing packets and packaging them into the .pcap format.

3. **Analysis Windows**: Wireshark provides three separate analysis windows:

   - **Packet List Pane**: Displays color-coded packets moving in real time.
   - **Packet Details Pane**: Provides header information from the selected packet.
   - **Packet Bytes Pane**: Provides payload information in both hexadecimal format and ASCII format.

4. **Creating filters**:

   - Filters are used to narrow down the traffic to see only the packets of interest.
   - Filters can be based on protocols, IP addresses, ports, or strings in the payload.
   - Filters have a syntax that uses operators and fields, such as `tcp.dstport==80` or `ip.addr==192.168.1.107`.
   - Filters can be entered in the filter window or selected from the expressions icon.
   - Some common operators are `==`, `!=`, `>`, `<`, `contains`, and `matches`.

5. **Following a Stream**: Wireshark allows you to follow a stream of communication, which can be useful in tracking a specific conversation.

   - Select a packet by clicking on it.
   - Right-click to open a pull-down window.
   - Click "Follow" and then "TCP Stream".
   - This opens a window that includes all the packets and their content in this stream.

6. **Gathering Statistics**: Wireshark can gather statistics on your packet capture, useful for creating a baseline of normal traffic.
   - Click on the "Statistics" tab at the top of Wireshark.
   - Navigate down to the "IPv4 Statistics" and then "All Addresses".
   - This opens a window that displays statistics for each IP address in your packet capture.

## Summarized version of _*that*_ ER diagram:

1. **moz_bookmarks_roots**: Contains root folders for bookmarks.
2. **moz_bookmarks**: Stores bookmark items with details like type, position, and associated keyword ID.
3. **moz_keywords**: Holds keywords associated with bookmarks.
4. **moz_historyvisits**: Records user's web browsing history visits.
5. **moz_inputhistory**: Holds information about input that the user entered into the browser.
6. **moz_favicons**: Contains information about favicons of visited websites.
7. **moz_places**: Central table storing URLs visited by the user along with visit count and other details.
8. **moz_annos**: Used for storing annotations, which are arbitrary metadata associated with a page or a bookmark item.
9. **moz_items_annos**: Similar to moz_annos but used specifically for bookmark items.
10. **moz_anno_attributes**: Stores names of different annotation attributes.

Each table is connected to others indicating relationships between them.
