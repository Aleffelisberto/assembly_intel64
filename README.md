# Intel64 Architecture Assembly

To run a program, I used the following tools:

- GNU\Linux (or WSL) as Operating System
- NASM 2.15.05 as Assembly compiler

To compile and run a program:

```bash
nasm -felf64 <program> -o <bin_file>
ld -o <executable> <bin_file>
chmod u+x <executable>
./<executable>
```
