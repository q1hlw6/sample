# Sample Application for [REDACTED]

This repository contains the sample application for an assignment from [REDACTED].

## License

All contents of this repository are copyright of the author and may not be reproduced.

## Instructions

The sample WAR file can be "built" using the provided Makefile:
```console
make clean all
```

After the WAR file has been downloaded the Docker image can be built as usual:
```console
docker build -t sample:latest .
```

The pipeline defined in the Jenkinsfile supports two optional parameters:

* `DOCKER_REGISTRY_URL`: the URL for the ECR registry (e.g. `https://123456789012.dkr.ecr.eu-west-1.amazonaws.com/`)
* `DOCKER_REGISTRY_CREDENTIALS`: reference to Jenkins username/password credentials

The username for ECR is always `AWS` and a password can be fetched with the AWS CLI:
```console
aws ecr get-login-password
```

When these parameters are present the built image will be pushed to the specified Docker registry.
