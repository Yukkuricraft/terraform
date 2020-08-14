#cloud-config

users:
- name: yctoolbox
  uid: 2000
  groups: docker


write_files:
- path: /etc/systemd/system/ycinfrabot.service
  permissions: 0644
  owner: root
    [Unit]
    Description=Runs the YCInfraBot service
    Requires=docker.service network-online.target
    After=docker.service network-online.target

    [Service]
    Environment="HOME=/home/yctoolbox"
    ExecStartPre=/usr/bin/docker-credential-gcr configure-docker
    ExecStartPre=/usr/bin/docker pull gcr.io/${gcr_project_id}/${gcr_image_name}:${gcr_image_tag}
    ExecStart=/usr/bin/docker run \
        --rm \
        -u 2000 \
        --name=ycinfrabot \
        gcr.io/${gcr_project_id}/${gcr_image_name}:${gcr_image_tag}
    ExecStop=/usr/bin/docker stop ycinfrabot
	Restart=on-failure
	RestartSec=30

	[Install]
	WantedBy=multi-user.target

runcmd:
- systemctl daemon-reload
- systemctl start ycinfrabot
