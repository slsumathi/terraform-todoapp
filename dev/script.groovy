// You can define variables and functions also here
// We have access to all the params and environment variables defined inside Jenkinspipeline file

def buildDevapp () {
    //sh 'cd dev'
    sh "terraform --version"

    // sh 'terraform workspace new dev'
    // sh "terraform init"
    // sh "ansible terraform.yml"
}

def buildProdapp () {
    // sh 'cd prod'
    // sh 'terraform workspace new dev'
    // sh "terraform init"
    // sh "ansible terraform.yml"
}

return this
