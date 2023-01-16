output "vm_azure_ip" {
  value = aws_instance.vm.public_ip
}

output "vm_aws_ip"{
  value = azure_linux_virtual_machine.vm.public_ip_adress
}