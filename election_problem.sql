select party_name from (
with trans as
(
SELECT vote_qty/COUNT(*) cnt,count(*),candidate_name from f_vote group by candidate_name,vote_qty
)
select a.party_name,sum(b.cnt) from f_vote a join trans b on a.candidate_name=b.candidate_name group by a.party_name order by sum(b.cnt) desc
) where rownum=1;