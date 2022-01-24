drop view if exists Party_Company;

create view Party_Company(party, company) as
(with recursive AllSubsidiary(parent, child) AS (
	select parent, child from Subsidiary
	union
	select A.parent, S.child
	from AllSubsidiary A, Subsidiary S
	where A.child = S.parent)
select P.party as party, A.parent as company
from Politician P, Invested I, AllSubsidiary A
where P.pname = I.pname
and I.cname = A.parent
UNION
select P.party as party, A.child as company
from Politician P, Invested I, AllSubsidiary A
where P.pname = I.pname
and I.cname = A.parent
UNION
select P.party as party, I.cname as company
from Politician P, Invested I
where P.pname = I.pname);

select PC.party as party, sum(C.revenue) as total_revenue
from Party_Company PC, Company C
where PC.company = C.cname
group by PC.party
order by party;