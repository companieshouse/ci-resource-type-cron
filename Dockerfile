FROM cftoolsmiths/cron-resource:latest AS source

FROM amazonlinux:2 AS final

COPY --from=source /opt/resource/ /opt/resource/

RUN yum upgrade -y && \
    yum clean all
