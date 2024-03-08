#!/bin/bash
docker run \
--rm \
--env BUILD_CMD='cd /project/web-demo && mvn -Pnative native:compile -Dmaven.test.skip=true -s settings.xml' \
--volume $(pwd)/web-demo:/project/web-demo \
yuanzhibang/java-native-image-build:21
