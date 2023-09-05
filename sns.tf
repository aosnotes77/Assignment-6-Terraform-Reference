# create an sns topic
resource "aws_sns_topic" "user_updates" {
  name = 
}

# create an sns topic subscription
resource "aws_sns_topic_subscription" "notification_topic" {
  topic_arn = 
  protocol  = 
  endpoint  = 
}
