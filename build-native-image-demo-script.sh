#! /bin/bash

# build native image
#! you need to set the volume and env by yourself
docker run \
--rm \
--env BUILD_CMD='cd /project && mvn -Pnative native:compile -Dmaven.test.skip=true -s settings.xml' \
--volume $(pwd)/web-demo:/project \
yuanzhibang/java-native-image-build:21

# package the deploy docker image
#! you need to set the PROJECT_DIR by yourself
PROJECT_DIR=$PWD/web-demo
cd $PROJECT_DIR/target

for file in $(find . -name "*.jar")
do
    # get the version and the app name from the jar file
    APP_NAME=$(basename $file .jar | sed 's/-[0-9].*//')
    VERSION=$(basename $file .jar | sed 's/.*-\([0-9].*\)/\1/')
    echo $APP_NAME
done
cd $PROJECT_DIR

# create a tmp folder
mkdir .tmp-docker-build
# copy the exe file and the Dockerfile to the tmp folder
cp ./target/web-demo .tmp-docker-build/app
cp ../deploy-Dockerfile .tmp-docker-build/Dockerfile
cd .tmp-docker-build
docker build -t yuanzhibang/native-image-$APP_NAME:$VERSION .
# rm the tmp folder
rm -rf $PROJECT_DIR/.tmp-docker-build

docker image tag yuanzhibang/native-image-$APP_NAME:$VERSION yuanzhibang/native-image-$APP_NAME:latest
docker image tag yuanzhibang/native-image-$APP_NAME:$VERSION yuanzhibang/native-image-$APP_NAME:default

# push the image
docker push yuanzhibang/native-image-$APP_NAME:$VERSION
docker push yuanzhibang/native-image-$APP_NAME:latest
docker push yuanzhibang/native-image-$APP_NAME:default

# you can run `docker run yuanzhibang/native-image-web-demo:latest` to start the app
