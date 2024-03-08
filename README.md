# docker-build-native-image
You can use this docker image for build native-image for java

[Github Repo](https://github.com/yuanzhibang-tool/docker-build-native-image.git)

### Scripts description

1. `build-docker.sh` build the docker image and push to docker.io

2. `build-in-docker.sh` build script for package the native image for java in the docker, you need set the env `BUILD_CMD` for building, see `build-native-image-demo-script.sh` for more.

3. `build-native-image-demo-script.sh` build script demo

4. `web-demo` an empty springboot project for building java native image

---

More about `native image`, please visit [Spring Boot Native Image](https://docs.spring.io/spring-boot/docs/current/reference/html/native-image.html) & [graalvm](https://www.graalvm.org/latest/docs/)
