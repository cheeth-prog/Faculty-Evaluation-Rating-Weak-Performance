--select all the data
select * from details
select * from fer_response

--what department has the lowest performance rating
--can you give the name (if possible)
select D.realdept,R.nameofteacher,
avg(R.section_total_average) as total_average
from fer_response R
left join details D
on R.nameofteacher=D.nameofteacher
group by D.realdept,R.nameofteacher
order by avg(R.section_total_average) asc

--do having many subjects taught can affect the performance of the teacher
select R.nameofteacher,D.teachersdepartmenttaught,D.realdept,
avg(R.section_total_average)
from fer_response R
left join details D
on R.nameofteacher=D.nameofteacher
group by R.nameofteacher,D.teachersdepartmenttaught,D.realdept
order by avg(R.section_total_average) asc

--what is the most common weakness do poor performace rating have(below 3)
select nameofteacher,avg(section_total_average)
from fer_response
group by nameofteacher
order by avg(section_total_average) asc
limit 3

--weakness
select nameofteacher,weaknesses
from fer_response
where nameofteacher = 'Sarahadil, Ayman N'

--what course do usually affected by this issue (weal performance)
select nameofteacher,section
from fer_response
where nameofteacher = 'Sarahadil, Ayman N'

--for visualization--

--what is the total average per department
select D.realdept,avg(R.section_total_average)
from fer_response R
inner join details D
on R.nameofteacher=D.nameofteacher
group by D.realdept

--how many students finish rating there instructor
select count(*) as total_counting
from fer_response

