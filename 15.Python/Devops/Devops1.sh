运维开发实战
NSD DEVOPS DAY01
1.多线程编程
2.
##############################################################################	
什么是forking
•  fork(分岔)在Linux系统中使用非常广泛
•  当某一命令执行时,父进程(当前进程)fork出一个子进程
•  父进程将自身资源拷贝一份,命令在子进程中运行时,
	就具有和父进程完全一样的运行环境

	#!/usr/bin/env python3
	import os
	print('hello')
	os.fork()
	print('哈哈哈哈')
   [root@room9pc01 day1]# python3 fork_.py 
	hello
	哈哈哈哈    #父进程把剩下代码拷贝一份，放到子进程运行
	哈哈哈哈    #在父进程也运行一遍

	#!/usr/bin/env python3
	import os
	print('hello')
	pid=os.fork()
	if pid:
		print('父进程 ......')
	else:
		print('子进程......')
	print('又来了')
	[root@room9pc01 day1]# python3 fork_2.py 
	hello
	父进程 ......   #在父进程执行，因为父进程pid非0
	又来了           #父进程执行
	子进程......    #子进程执行，fork()后面的程序，拷贝到子进程执行，pid为空
	又来了           #子进程执行
##############################################################################
fork编程思路
1.一定要明确父子进程的分工
2.
