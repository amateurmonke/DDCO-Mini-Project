# Title: Design and Implementation of a Circuit to Count the Number of Ones in the given Data

Made as a part of PES University's Digital Design and Computer Organization (DDCO) course. 

# Abstract (PES made me write this)
This project aims to present a hardware solution for counting the number of 1s in a 16-bit input data stream. It utilizes a modular approach to divide the task into smaller, manageable components. 
The design consists of multiple 4-bit counters, each of which are responsible for counting the 1s in a segment of the 16-bit input. These partial counts are then added together using binary adders to obtain the final result. 
The system architecture is based on two key modules: a 4-bit counter for counting the number of 1s in a 4-bit segment, and a 4-bit adder for summing these partial counts. 
The final result is a 5-bit output that represents the total number of 1s in the 16-bit input. 

