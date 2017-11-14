select Count(*) as Questions
from Posts questions
INNER JOIN PostTags on questions.Id = PostTags.PostId
INNER JOIN Tags on PostTags.TagId = Tags.Id
WHERE Tags.TagName = 'python'