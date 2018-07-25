FROM ansible/centos7-ansible:stable
# or, for example, FROM ansible/ubuntu14.04-ansible:stable

# Add playbooks to the Docker image
ADD ansible /ansible
WORKDIR /ansible

# Run Ansible to configure the Docker image
RUN ansible-playbook site.yml -c local; exit 0

# Other Dockerfile directives are still valid
EXPOSE 22 3000 80
ENTRYPOINT ["/ansible", "-DFOREGROUND"]