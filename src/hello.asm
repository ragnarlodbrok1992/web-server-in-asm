format ELF64 executable

SYS_write = 1
SYS_exit  = 60

macro write fd, buf, count
{
    lea rsi, [buf]
    mov edx, count 
    mov edi, fd
    mov eax, SYS_write
    syscall
}

macro exit exit_code
{
    mov edi, exit_code
    mov eax, SYS_exit
    syscall
}

segment readable executable
entry main
  main:
    write 1, msg_hello_world, msg_hello_world_size
    exit 0

segment readable writable
  msg_hello_world db 'Hello 64-bitworld!', 0xA
  msg_hello_world_size = $ - msg_hello_world

