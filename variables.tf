variable "aws_region" {
    description = "Region de AWS donde se desplegan los recursos"
    type = string
    default = "us-east-1"
}

variable "access_key" {
  description = "Access Key de AWS"
  type = string
}

variable "secret_key" {
  description = "Secret Key de AWS"
  type = string
}

variable "token" {
  description = "ession Token de AWS"
  type = string
}

variable "git_token" {
  description = "Token GIT para acceso"
  type = string
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type = string
}
