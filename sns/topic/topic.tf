resource "aws_sns_topic" "sns_topic" {
  name = "${var.name}"
  display_name = "${var.name}"
  tags = {
    Name        = "${var.name}"
    Project     = "${var.project}"
    Description = "${var.description}"
  }
}

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn    = aws_sns_topic.sns_topic.arn
  policy = data.aws_iam_policy_document.notif_access.json
}