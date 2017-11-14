SELECT questions.Id, COUNT(answerme.answerId) as HasAcceptedAnswer
FROM Posts questions
LEFT JOIN (
    select answers.ParentId as answerId
    FROM Posts answers
    INNER JOIN Votes on answers.Id = Votes.PostId
    WHERE Votes.VoteTypeId = 1
)
as answerme on answerme.answerId = questions.Id
INNER JOIN PostTags on questions.Id = PostTags.PostId
INNER JOIN Tags on PostTags.TagId = Tags.Id
WHERE Tags.TagName = 'python'
GROUP BY questions.Id
ORDER BY RAND()