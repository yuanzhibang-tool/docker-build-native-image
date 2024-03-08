repoName='yuanzhibang/java-native-image-build'
dockerFile='Dockerfile'

docker build -t $repoName:latest -f $dockerFile .  --no-cache

docker image tag $repoName:latest $repoName:21

docker push $repoName:latest
docker push $repoName:21