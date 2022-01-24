with recursive AllSubsidiary(parent, child) AS (
	select parent, child from Subsidiary
	union
	select A.parent, S.child
	from AllSubsidiary A, Subsidiary S
	where A.child = S.parent)
select I1.pname as pname1, I2.pname as pname2
from Invested I1, AllSubsidiary A, Invested I2
where I1.cname = A.parent
and I2.cname = A.child
order by pname1, pname2;