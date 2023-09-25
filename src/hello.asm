format ELF64 executable

macro write fd, buf, count
{
    lea rsi, [buf]
    mov edx, count 
    mov edi, fd      ; STDOUT
    mov eax, 1      ; sys_write
    syscall
}

macro exit exit_code
{
    mov edi, exit_code
    mov eax, 60
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

