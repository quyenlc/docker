FROM quyenlc/centos6:latest
RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.0.4-1.x86_64.rpm 
RUN sudo yum localinstall grafana-5.0.4-1.x86_64.rpm -y
RUN sudo service grafana-server start
RUN sudo /sbin/chkconfig --add grafana-server
ADD init-server.sh init-server.sh
RUN sudo chmod +x  ./init-server.sh
CMD ["./init-server.sh"]