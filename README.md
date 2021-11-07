
# 5-bits-input-ALU

By: </br>
Mohammed Almansour </br>
Yazeed Almusallam </br>
Abdulrahman Almazroa </br>

| Selectors | Operation |
| ------------- | ------------- |
| 00  | Add: A+B  |
| 01  | Subtract: A-B  |
| 10  | Multiply A* B (using parallel multiplier) |
| 11  | A’ |


Our main objective to design a customized ALU that performs four operations: add, subtract,
multiplication, and bit inversion; the inputs of ALU are A and B, Both are 5-bits input and 2-bits selection line S (s1: s0). We assume the input Cin is used to select between the two operations (add and subtract) as in AdderSubtractor circuit, hence the user cannot use the Cin in order to add it with A and B. we have outputs of 10-bits result and Cout, along with the result output there are 4 indicators outputs to determine if A≤B, A≥B, Output is zero, and Output is negative.

| Inputs  | Outputs |
| ------------- | ------------- |
| Unsigned 5-bit input A (a5: a0)  | Y: 10 bits (Y9:Y0)  |
| Unsigned 5-bit input B (b5: b0)  | Cout (for adder and subtractor)  |
| A 2-bit selector S (s1: s0)  | A<=B |
|   | A>=B  |
|    | Output is zero  |
|   | Output is negative  |
