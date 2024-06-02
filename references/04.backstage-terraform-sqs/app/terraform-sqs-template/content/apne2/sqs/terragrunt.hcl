terraform {
  source = "../../github.com/aws-sqs"
}

include {
  path = "${find_in_parent_folders()}"
}

inputs ={
  name = "${{ values.name }}"

  tags = {
      Service = "sqs"
  }
}