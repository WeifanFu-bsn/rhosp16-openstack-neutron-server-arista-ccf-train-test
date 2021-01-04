FROM registry.redhat.io/rhosp-rhel8/openstack-neutron-server:16.1
MAINTAINER Arista Networks Inc <support@arista.com>
LABEL name="rhosp16/openstack-neutron-server-arista-ccf" \
      maintainer="support@arista.com" \
      vendor="Arista Networks Inc" \
      version="16.1" \
      release="1" \
      summary="Red Hat OpenStack Platform 16.1 neutron-server Arista Networks Converged Cloud Fabric ML2 Plugin" \
      description="Red Hat OpenStack Platform 16.1 neutron-server Arista Networks Converged Cloud Fabric ML2 Plugin"
USER "root"

#ADD networking-bigswitch /tmp/networking-bigswitch

WORKDIR /tmp/
RUN git clone netoworking-bigswitch --branch stable/train
WORKDIR /tmp/networking-bigswitch
RUN python3 setup.py install

#RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py"
#RUN python /tmp/get-pip.py
#RUN pip install --upgrade "networking-bigswitch>=12.0.0,<12.1.0"

# copy License
#RUN mkdir /licenses
#RUN curl -L -o /licenses/LICENSE https://raw.githubusercontent.com/openstack/networking-bigswitch/master/LICENSE

USER "neutron"
