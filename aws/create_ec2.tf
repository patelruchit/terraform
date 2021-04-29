
#Choose the provider and its authentication 
provider "aws" {
    region ="us-east-1"
    access_key = "<your key here> or <call from variable>"
    secret_key = "<your secret here> or <call from variable>""
}

# Create an EC2 Instance
resource "aws_instance" "UbuntuTF" {                    # The 'Ubuntu_from_TF' name is not significant for AWS, used as reference in the TF code
    ami = "<ami-from-aws-here>"                       # This is the AMI for Ubuntu Server 20.04 LTS (HVM) taken from AWS
    instance_type = "t2.micro"
    subnet_id = "<subnet-id-from-aws-here>"              # The subnet belongs to a specific VPC, so the instance will be that VPC.
    security_groups = [ "<sg-id-from-aws-here>" ]
    tags = {
      "Name" = "Ubuntu-by-TF"
    }
    key_name = "<Your-key-here>"
    
    
# Tell terraform that the following lines to be used in user data. 
    # user_data = << EOF                                                             
    #             #!/bin/bash
    #             sudo apt update -y
    #             sudo apt install apache2 -y
    #             sudo systemctl start apache2
    #             EOF
}
