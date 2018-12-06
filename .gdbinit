#设置stl调试
define stl
source /home/tool/stl-views-1.0.3.gdb
end
document stl
stl 调试 command.
end

# 保存历史命令
set history filename ./.gdb_history
set history save on
 
 
# 记录执行gdb的过程
set logging file ./.log.txt
set logging on
 
 
# 退出时不显示提示信息
#set confirm off
 
 
# 打印数组的索引下标
set print array-indexes on
 
 
# 每行打印一个结构体成员
set print pretty on
 
 
# 退出并保留断点
define qbp
save breakpoints ./.gdb_bp
quit
end
document qbp
Exit and save the breakpoint
end
 
 
# 保留历史工作断点
define downbp
save breakpoints ./.gdb_bp
end
document downbp
Save the historical work breakpoint
end
 
 
# 加载历史工作断点
define loadbp
source ./.gdb_bp
end
document loadbp
Load the historical work breakpoint
end

#打开数组显示，让每个元素占一行
set print array on 
 
#让GDB更美观地显示结构体
set print pretty on 
  
#显式显示结构体内的联合体数据
set print union on
 
#让GDB按照虚方法调用的规则显示输出
set print object on

python
import sys
sys.path.insert(0, '/home/tool/python-stl')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
