/*
# Consider a scenario where we have 4 parties and a person can give votes 
to multiple parties but if he/she votes multiple time so the vote should be adjusted accordingly. 
Like a person votes all the 4 parties so his vote goes to each party by 0.25,
if votes thrice so vote should go like 0.33. How you will handle this, how many tables??

*/
-- 3 tables, 2 dims and 1 fact
select party_name from (
with trans as
(
SELECT vote_qty/COUNT(*) cnt,count(*),candidate_name from f_vote group by candidate_name,vote_qty
)
select a.party_name,sum(b.cnt) from f_vote a join trans b on a.candidate_name=b.candidate_name group by a.party_name order by sum(b.cnt) desc
) where rownum=1;
