.text
main:
ADDIU  $r1,$r0,a # 取向量a的地址
ADDIU  $r2,$r0,b # 取向量b的地址
ADDIU  $r3,$r0,n # 取n的地址
BGEZAL  $r0, naive_prod # 调用naive_prod
NOP  # 无操作
TEQ $r0,$r0

naive_prod:
LW     $r3, 0($r3) # 取n的值
ADD    $r4, $r0, $r0 # 初始化 i = 0
ADD    $r5, $r0, $r0 # 初始化 ans = 0
loop:
LW     $r6, 0($r1) # 取a[i]
LW     $r7, 0($r2) # 取b[i]
MUL    $r8, $r6, $r7 # 计算a[i]*b[i]
ADD    $r5, $r5, $r8 # ans += a[i]*b[i]
ADDIU  $r1, $r1, 4 # 取a[i+1]的地址
ADDIU  $r2, $r2, 4 # 取b[i+1]的地址
ADDIU  $r4, $r4, 1 # i++
BNE    $r4, $r3, loop # i != n, 跳转到loop
JR     $r31 # 返回

.data
a: 
.word 1,2,3,4,5,6,7,8,9,10,11,12
b:
.word 1,2,3,4,5,6,7,8,9,10,11,12
n:
.word 12