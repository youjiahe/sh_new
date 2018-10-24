##################################################################################
CPU配额
● Docker_CPU份额控制
  & docker提供了–cpu-shares参数，在创建容器时指定容器所使用的CPU份额值。使用示例：
  docker run -tid –cpu-shares 100 centos:latest

  cpu-shares的值不能保证可以获得1个vcpu或者多少GHz的CPU资源，仅仅只是一个弹性的加权值。s
   默认情况下，每个docker容器的cpu份额都是1024。
   单独一个容器的份额是没有意义的，只有在同时运行多个容器时，容器的cpu加权的效果才能体现出来。
   例如，两个容器A、B的cpu份额分别为1000和500，在cpu进行时间片分配的时候，
   容器A比容器B多一倍的机会获得CPU的时间片

● Docker_CPU周期控制
  cpu-period和cpu-quota的单位为微秒（μs）。
  cpu-period的最小值为1000微秒，最大值为1秒（10^6 μs），默认值为0.1秒（100000 μs）。
  cpu-quota的值默认为-1，表示不做控制。

  & 举个例子，
   如果容器进程需要每1秒使用单个CPU的0.2秒时间，可以将
  cpu-period设置为1000000（即1秒），
  cpu-quota设置为200000（0.2秒）。

   当然，在多核情况下，如果允许容器进程需要完全占用两个CPU，则可以将
  cpu-period设置为100000（即0.1秒），
  cpu-quota设置为200000（0.2秒）。

  &使用命令创建容器
   docker run -tid –cpu-period 100000 –cpu-quota 200000 ubuntu:latest
##################################################################################
内存配额控制
● 相关配置项
   –memory:
     设置容器使用的最大内存上限。默认单位为byte，可以使用K、G、M等带单位的字符串。
   –memory-reservation：
     — 启用弹性的内存共享，
     — 当宿主机资源充足时，允许容器尽量多地使用内存，
     — 当检测到内存竞争或者低内存时，强制将容器的内存降低到memory-reservation所指定的内存大小。
     — 按照官方说法，不设置此选项时，有可能出现某些容器长时间占用大量内存，导致性能上的损失。
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
