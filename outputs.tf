output "ubuntu_2404_ami_id" {
  value = data.aws_ami.ubuntu_2404.id

}

output "ubuntu_2404_ami_name" {
  value = data.aws_ami.ubuntu_2404.name

}

output "aws_region" {
  value = var.aws_region

}

output "connect_to_ec2_via_ssh" {
  description = "use the following command to connect to your ec2 instance with SSH."
  value       = "ssh ubuntu@${var.tfe_dns_record}-${random_pet.hostname_suffix.id}.${var.hosted_zone_name}"
}

output "tfe-docker-fqdn" {
  description = "tfe-fqdn"
  value       = "${var.tfe_dns_record}-${random_pet.hostname_suffix.id}.${var.hosted_zone_name}"

}

output "first_user_instructions" {
  description = "How to get the admin token and setup the first user"
  value = templatefile("./templates/get_admin_token.tftpl", {
    tfe_hostname = "${var.tfe_dns_record}-${random_pet.hostname_suffix.id}.${var.hosted_zone_name}"
  })

}
