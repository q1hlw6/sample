podTemplate(
    containers: [
        containerTemplate(name: 'build', image: 'gcc:latest', ttyEnabled: true, command: 'cat'),
        containerTemplate(name: 'docker', image: 'docker:latest', ttyEnabled: true, command: 'cat'),
    ],
    volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]
)
{
    node(POD_LABEL) {
        def dockerImageName = 'sample'
        def dockerImageBuildTag = "jenkins-${env.BUILD_NUMBER}"
        def dockerImagePushTag = 'latest'
        def dockerImage

        stage('Checkout') {
            checkout scm
        }

        stage('Build') {
            container('build') {
                sh 'make'
            }

            container('docker') {
                dockerImage = docker.build("${dockerImageName}:${dockerImageBuildTag}")
            }
        }

        if (params.DOCKER_REGISTRY_URL != "") {
            stage('Push') {
                container('docker') {
                    docker.withRegistry(params.DOCKER_REGISTRY_URL, params.DOCKER_REGISTRY_CREDENTIALS) {
                        dockerImage.push(dockerImagePushTag)
                    }
                }
            }
        }
    }
}
