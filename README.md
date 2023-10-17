# IPv4 Header Checksum

## Introduction

The IPv4 checksum is a simple yet crucial feature in the Internet Protocol version 4 (IPv4) header. It serves as a form of error-checking mechanism to ensure the integrity of data as it is transmitted over the Internet. The checksum is a 16-bit field located in the IPv4 header and is used for detecting errors in the header itself, primarily focusing on the header fields, such as the source and destination IP addresses, time-to-live (TTL), protocol, and header length.

The checksum is computed by taking a one's complement sum of 16-bit words within the header. If there are any errors during transmission, the checksum value will not match the recalculated checksum at the receiving end, indicating that the packet may be corrupt and should be discarded. This helps ensure the reliability of data transmission in IPv4 networks.

It's worth noting that while the IPv4 checksum is useful for header error detection, it does not provide end-to-end data integrity for the entire packet. Higher-layer protocols, such as TCP or UDP, handle the data payload's integrity, leaving the IPv4 checksum to focus on the header's correctness. As the networking world has evolved, the more modern Internet Protocol version 6 (IPv6) has largely replaced IPv4, and it uses different methods for error checking and security, like the CRC (Cyclic Redundancy Check) in its headers.

## Working

The IPv4 checksum works by calculating a checksum value for the header of an IPv4 packet to detect errors in the header during transmission. Here's a step-by-step explanation of how it works:

1. Dividing the Header: The IPv4 header consists of several fields, including the source and destination IP addresses, the time-to-live (TTL), the protocol number, and others. These fields are divided into 16-bit words, and the checksum is calculated over these words.

2. Checksum Calculation: To calculate the checksum, the 16-bit words are added together using one's complement addition. This means that you add the 16-bit values, and if there's a carry (overflow) from the most significant bit when you add, you add it back into the result. This process is repeated for all the 16-bit words in the header.

3. One's Complement Sum: After adding all the 16-bit words, the sum is taken using one's complement arithmetic. To get the one's complement sum, you simply invert all the bits of the final sum. This inversion effectively inverts all the 0s to 1s and vice versa.

4. Inserting the Checksum: The one's complement sum is then inserted into the 16-bit checksum field in the IPv4 header. This is the value that will be checked at the receiver's end.

5. Verification at the Receiver: When the packet arrives at its destination, the receiver calculates the checksum in the same way, which includes adding up all the 16-bit words in the header and taking the one's complement sum. If the calculated checksum matches the value in the header, it means there were no errors in the header during transmission, and the packet is considered valid. If the values don't match, it indicates an error in the header, and the packet may be discarded.

The IPv4 checksum is primarily intended to check the integrity of the header information, ensuring that important routing and control information is correctly received. It does not provide end-to-end data integrity for the entire packet's payload. Higher-layer protocols, like TCP or UDP, have their own checksums to verify the integrity of data in the payload. This combination of checksums helps ensure the overall reliability of data transmission in IPv4 networks.

## Advantages of the IPv4 checksum:

1. **Header Integrity**: It ensures the integrity of the header in IPv4 packets, verifying essential routing and control information.

2. **Simplicity**: The checksum calculation is straightforward and efficient, adding minimal overhead to the packet processing.

## Disadvantages of the IPv4 checksum:

1. **Limited Error Detection**: It only checks the header's integrity, not the payload. Errors in the data payload may go undetected.

2. **No Error Correction**: While it can detect errors, it can't correct them. Discarded packets require retransmission, potentially leading to network congestion.

3. **Not Secure**: It's not designed for security; it only detects unintentional errors, not deliberate attacks or tampering.

## Applications


![Screenshot from 2023-10-17 22-25-39](https://github.com/akshatva7/pes_checksum/assets/135726741/4d75dc4c-a14f-4abb-99ac-3b9aacdd6335)


