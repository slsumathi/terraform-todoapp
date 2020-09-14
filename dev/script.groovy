#!groovy

// You can define variables and functions also here
// We have access to all the params and environment variables defined inside Jenkinspipeline file

def buildDevapp () {
    println("This is dev build")
    terraform --version
}

def buildProdapp () {
    println("This is production build")
}

return this
