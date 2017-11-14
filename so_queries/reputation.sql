select answers.Id, Users.Reputation
from Posts answers
INNER JOIN Posts questions on questions.Id = answers.ParentId
INNER JOIN PostTags on questions.Id = PostTags.PostId
INNER JOIN Tags on PostTags.TagId = Tags.Id
INNER JOIN Users on answers.OwnerUserId = Users.Id
WHERE Tags.TagName = 'python'