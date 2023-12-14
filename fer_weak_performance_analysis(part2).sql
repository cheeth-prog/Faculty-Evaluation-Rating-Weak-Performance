--total_sum of ratee per department
select D.realdept,
count(R.emailaddress) as total_ratee
from fer_response R
left join details D
on R.nameofteacher=D.nameofteacher
group by D.realdept

--number of teacher that is below average ratee
select D.realdept,R.nameofteacher,
avg(R.section_total_average) as total_average
from fer_response R
left join details D
on R.nameofteacher=D.nameofteacher
group by D.realdept,R.nameofteacher
having avg(R.section_total_average) < 4.41


