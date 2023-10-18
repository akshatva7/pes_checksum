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

The IPv4 checksum is primarily used to ensure the integrity of the header information in IPv4 packets. Its applications include:

1. **Error Detection:** Detecting errors or corruption in the IPv4 header during transmission, helping to maintain the reliability of network routing and control information.

2. **Packet Filtering:** Firewalls and network security devices can use the checksum to filter out potentially malicious or malformed packets based on header integrity.

3. **Network Troubleshooting:** It aids in diagnosing network issues by identifying header errors, allowing network administrators to pinpoint and address problems.

4. **Quality of Service (QoS):** Ensuring that critical header information, like the time-to-live (TTL), is correct for maintaining proper network QoS and routing decisions.

5. **Packet Forwarding:** Routers use the checksum to validate and forward packets accurately through the network.

These applications collectively contribute to the reliable and error-free operation of IPv4 networks.

## Simulation

```sh
iverilog checksum_tb.v
./a.out
gtkwave checksum.vcd

```
![Screenshot from 2023-10-17 23-47-24](https://github.com/akshatva7/pes_checksum/assets/135726741/df25428b-1565-4ae9-b74b-e1b143a7aea5)

![Screenshot from 2023-10-17 23-46-32](https://github.com/akshatva7/pes_checksum/assets/135726741/cd8411e2-303e-417d-9ff6-4c1a6b1f12ce)

### GTK waveform
![Screenshot from 2023-10-17 23-49-32](https://github.com/akshatva7/pes_checksum/assets/135726741/71c06132-587b-4e6b-8dc2-9fe787c68b4a)

## Synthesis

- Invoke ```yosys```
![Screenshot from 2023-10-17 22-27-52](https://github.com/akshatva7/pes_checksum/assets/135726741/8eea29ce-22ad-47fc-8256-e3aeca7dbaec)
 
- ```read_liberty -lib /home/akshatva/vsd/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_0235C_1v80.lib```
![Screenshot from 2023-10-17 22-28-22](https://github.com/akshatva7/pes_checksum/assets/135726741/19f52f2f-0dec-458b-a683-ad6fc58fc514)

- ```read_verilog checksum_generate.v```
- ```synth -top checksum_generate```
![Screenshot from 2023-10-17 22-28-22](https://github.com/akshatva7/pes_checksum/assets/135726741/ee4c479e-09ff-4d3f-95db-1e88dec022b7)

- ```dfflibmap -liberty /home/akshatva/vsd/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_0235C_1v80.lib```
- ``` abc -liberty /home/akshatva/vsd/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_0235C_1v80.lib```
- ``` flatten```
![Screenshot from 2023-10-17 22-30-21](https://github.com/akshatva7/pes_checksum/assets/135726741/e6777fc8-73b1-433f-925a-29caddc6ec6d)
![Screenshot from 2023-10-17 22-29-20](https://github.com/akshatva7/pes_checksum/assets/135726741/74238e3a-03a7-4a26-8603-8fb0b7599368)
- Extract the NETLIST by using ``` write_verilog pes_checksum.v```
- ```show bitchecksum```
![Screenshot from 2023-10-18 00-01-18](https://github.com/akshatva7/pes_checksum/assets/135726741/0ee69f92-4466-41c7-be54-7dd05fedb375)

The followinfg files were saved in the working directory
![Screenshot from 2023-10-17 23-46-32](https://github.com/akshatva7/pes_checksum/assets/135726741/f0230315-4b07-47b7-b66c-81b1e9c68236)

### Final chart
![Screenshot from 2023-10-17 22-25-39](https://github.com/akshatva7/pes_checksum/assets/135726741/4d75dc4c-a14f-4abb-99ac-3b9aacdd6335)

## Gate Level Simulation
We check the design obtained by NETLIST file generated and verify the gate level simulation

- ```iverilog /home/akshatva/vsd/sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/primitives.v /home/akshatva/vsd/sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/sky130_fd_sc_hd.v pes_checksum.v checksum_tb.v```
- ```./a.out```
- ```gtkwave checksum.vcd```
![Screenshot from 2023-10-18 20-29-25](https://github.com/akshatva7/pes_checksum/assets/135726741/f461265c-977a-41dd-84b7-6938a8b98e4e)

![Screenshot from 2023-10-18 20-29-52](https://github.com/akshatva7/pes_checksum/assets/135726741/9ca8a97f-f829-4d6f-868f-995114f73b8f)




