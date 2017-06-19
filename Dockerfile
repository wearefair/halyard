FROM wearefair/ubuntu:trusty-openjdk8

COPY . workdir/

WORKDIR workdir

# Temporary workaround. Halyard installs properly, but then dpkg throws an error
RUN GRADLE_USER_HOME=cache ./gradlew buildDeb -x test && \
      dpkg -i ./halyard-web/build/distributions/*.deb; exit 0
RUN cd .. && \
      rm -rf workdir

CMD ["/opt/halyard/bin/halyard"]
