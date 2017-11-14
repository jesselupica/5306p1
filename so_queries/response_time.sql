SELECT 
    questions.Id,
    DATEDIFF(mi, questions.CreationDate, sub_query.Creation) as MinResponseTime
FROM
    Posts questions
INNER JOIN
    (SELECT
         ParentId,
         MAX(CreationDate) as Creation
     FROM
         Posts
     GROUP BY
         ParentId)
     AS sub_query ON (sub_query.ParentId = questions.Id)
INNER JOIN PostTags on questions.Id = PostTags.PostId
INNER JOIN Tags on PostTags.TagId = Tags.Id
WHERE Tags.TagName = 'python'     
Order by questions.Id desc