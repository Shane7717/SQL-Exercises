# Q3. 查询所有学生的学号、姓名、选课数、总成绩
-- 若部分问题答案有问题 欢迎交流指证

# My Original Answer:
select S1.s_id '学号', S1.s_name '姓名', count(*) '选课数', sum(s_score) '总成绩'
from Student S1, Score S2
where S1.s_id = S2.s_id
group by S1.s_id;

# 上面这个答案是有个问题的, 也是这道题的易错点：可能有学生没选课。显然，就算有学生没选课，我们也是希望把这个学生统计进去。
# 然后有个问题就是查询了非group by内的字段和非聚集字段 S1.s_name，这样做是不好的而且可能报错，所以可以把这个字段加进group by。
select S1.s_id '学号', S1.s_name '姓名', count(S2.c_id) '选课数',
ifnull(sum(s_score), 0) '总成绩'
from Student S1 left outer join Score S2 on S1.s_id = S2.s_id
group by S1.s_id, S1.s_name;

# 值得注意一点的就是我把count(*)改成了count(S2.c_id)，要不然王菊的选课数量就出现了问题。
# 还有就是使用了 ifnull 函数，来避免总成绩出现NULL的情况，改成0的话更直观。
