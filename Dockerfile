FROM centos:7
LABEL maintainer="Andrew Younge"


# Update yum repo and install base
RUN yum clean all && rpm --rebuilddb && yum update -y && \
	yum install -y yum-plugin-ovl wget epel-release git automake libtool m4 \
	cmake cmake3 libmpc-devel mpfr-devel gmp-devel gcc gcc-c++ make


# Install & Configure Spack
WORKDIR /
RUN git clone https://github.com/spack/spack.git
ENV SPACK_ROOT=/spack
ENV PATH=$SPACK_ROOT/bin:$PATH
RUN . $SPACK_ROOT/share/spack/setup-env.sh
#TODO: install spack siteconfig.
#COPY spack.yaml /spack/spack.yaml

# Test spack
RUN spack install zlib

