.text 
main: 
ADDIU   $r1, $r0, a # 取a地址 
ADDIU   $r2, $r0, n # 取n地址 
LW      $r2, 0($r2) # 取n 
BGEZAL  $r0, bubble # 调用bubble sort
NOP
TEQ     $r0, $r0

bubble:
SLL     $r2, $r2, 2 # n<<=2 
ADD     $r2, $r2, $r1   # 取a[n]地址 

loop1: 
ADDI    $r2, $r2, -4 # n-- 
ADDIU   $r3, $r1, 0 # 取a[1]地址 
BEQ     $r2, $r1, exit   # n==1跳转到exit

loop2: 
LW      $r4, 0($r3) # 取a[j] 
LW      $r5, 4($r3) # 取a[j+1] 
SLT     $r6, $r5, $r4   # 判断a[j+1]<a[j]
ADDI    $r3, $r3, 4 # j++ 
BEQ     $r6, $r0, iter  # a[j+1]>=a[j]跳转iter 
SW      $r5, -4($r3) # 交换a[j]和a[j+1] 
SW      $r4, 0($r3)

iter: 
BNE     $r3, $r2, loop2 # j!=n跳转到loop2
BEQ     $r0, $r0, loop1 # 跳转到loop1

exit:
JR     $r31 
 
.data 
a:  
.word 10,9,8,7,6,5,4,3,2,1 
n: 
.word 10