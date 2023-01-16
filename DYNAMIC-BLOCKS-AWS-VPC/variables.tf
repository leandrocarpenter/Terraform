variable "portas" {
  description = "Portas abertas no security group"
  type        = list(number)
  default     = [22, 80, 443, 8080]
}