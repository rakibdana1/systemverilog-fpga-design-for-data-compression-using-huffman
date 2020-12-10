# README #

This project has been designed and simulated on ModelSim SE-64 10.5. Compile and run "controller_tb" to simulate overall design.
You can also run different modules by running respective testbenches.

### What is this repository for? ###

FPGA design for data compression for secured transmission. This repo is based on the project for M.Engg in ICT — "Design of an FPGA Based System for High 
Speed Data Compression and Secured Transmission".

To secure text data for transmission, Hamming (7, 4) coding is used. It secures data by adding a layer of encryption as well as by providing 
facility for error detection and correction for reliable transmission. In this step, each character of sending text data is divided into groups 
of 4-bit data and encoded with 3 parity bits, thus resulting 7-bit code-word. This system can correct 2-bit errors in each 8-bit character. 
Furthermore, the system includes a two-level compression. During the first level of compression, redundant bits of 8 bit characters are removed 
which has been mentioned as bit-stuffing. After compressing by bit-stuffing, second level compression is done by Huffman algorithm. These two 
level compression processes can achieve higher saving percentage of memory. Hence, the system provides reliability in transmission and also 
compresses data to larger extent. The results obtained are highly promising and the system is very effective for providing high level reliability 
and higher saving percentage of memory which in turn reduces bandwidth and transmission time.

To learn more about the project, please read the project report in the repo.

### How do I get set up? ###
Create a project on Modelsim and add all the 'sv' files in the repo. Compile all.

### License ###
This project is licensed under the MIT License

### Who do I talk to? ###
Rakib Mohammad, rakibsr@gmail.com