# Q4. 查询姓“猴”的老师的个数
-- 若部分问题答案有问题 欢迎交流指证

# My Original Answer:
select count(t_name) from Teacher
where t_name like '猴%';

# 如果需要去重的话(这道题应该不需要) 需要使用distinct:
select count(distinct t_name) from Teacher
where t_name like '猴%';

-- 总的来说这道题很简单主要就是考察字段的模糊查询
