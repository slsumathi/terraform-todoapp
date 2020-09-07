# Jenkins job
# Add this Jenkinsfile in the same folder where you have Terraform scripts

pipeline {
    agent any  

    environment {
        PATH = "${PATH}/${getTerraformPath()}"
    }
              
    stages
    {
        stage('S3 bucket creation - dev')
        {  
            steps  
            {  
                script
                {
                    sh "ansible-playbook ansible/s3-bucket.yml"
                }
            }  
        }

        stage('terraform init and apply - dev')
        {
            steps
            {
                sh returnStatus: true; script: 'terraform workspace new prod'
                sh "terraform init"
                sh "ansible-playbook ansible/terraform.yml -e todoapp_env=prod"
            }
        }

        stage('terraform init and apply - dev')
        {
            steps
            {
                sh returnStatus: true; script: 'terraform workspace new prod'
                sh "terraform init"
                sh "ansible-playbook ansible/terraform.yml"
            }
        }
    }
}

# This will return the path where terraform is installed
def getTerraformPath()
{
    def tfHome = "Generated script from Jenkins"
    return tfHome
}
