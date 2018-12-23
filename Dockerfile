FROM mysql:5.6
RUN deluser mysql
RUN useradd mysql
RUN mkdir -p /Users/me/docker/mysql/data
RUN chmod -R 777 /Users/me/docker/mysql/data
