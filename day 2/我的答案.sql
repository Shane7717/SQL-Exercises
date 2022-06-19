# Q2. 查询平均成绩大于60分的学生的学号和平均成绩
-- 若部分问题答案有问题 欢迎交流指证

# My Original Answer:
select Student.s_id, avg(Score.s_score) from Student, Score
where Student.s_id = Score.s_id
group by Student.s_id
having avg(Score.s_score) > 60;

# 上面的答案其实是有问题的，两个表内连接没有意义，一张表就可以查出来
select S.s_id, avg(S.s_score) from Score S
group by S.s_id
having avg(S.s_score) > 60;
