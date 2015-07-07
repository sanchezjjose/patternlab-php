
# build an image from the php image
FROM php

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/pattern-lab/patternlab-php/archive/v1.0.0.tar.gz -O /tmp/pkg.tar.gz && \
    tar -zxf /tmp/pkg.tar.gz --xform='s/[^\/]*/patternlab/' -C /opt

WORKDIR /opt/patternlab

RUN php core/builder.php -g

WORKDIR /opt/patternlab/public

EXPOSE 8000

# Use built in PHP web server to serve the files
CMD ["php", "-S", "0.0.0.0:8000"]