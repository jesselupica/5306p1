select answers.Id, Count(CASE WHEN Votes.VoteTypeId = 2 then 1 else NULL END) as UpVotes, Count(CASE WHEN Votes.VoteTypeId = 3 then 1 else NULL END) as DownVotes
from Posts answers
INNER JOIN Posts questions on questions.Id = answers.ParentId
INNER JOIN PostTags on questions.Id = PostTags.PostId
INNER JOIN Tags on PostTags.TagId = Tags.Id
INNER JOIN Votes on answers.Id = Votes.PostId
WHERE Tags.TagName = 'python' AND (Votes.VoteTypeId = 2 OR Votes.VoteTypeId = 3)
GROUP BY answers.Id
ORDER BY answers.Id DESC