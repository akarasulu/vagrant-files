{
    "type": "parallels-iso",
    "output_directory": "output-{{ user `vm_name` }}-parallels-iso",
    "vm_name": "{{ user `vm_name` }}",
    "shutdown_command": "echo 'shutdown -P now' > shutdown.sh; echo {{user `ssh_pass`}} |sudo -S sh 'shutdown.sh'",
    "boot_command": import "common/bootcommand.jsonnet",
    "boot_wait": "10s",
    "http_directory": "preseeds",
    "iso_checksum": "{{ user `iso_checksum` }}",
    "iso_checksum_type": "{{ user `iso_checksum_type` }}",
    "iso_urls": [
      "{{ user `iso_path` }}/{{ user `iso_name` }}",
      "{{ user `iso_url` }}"
    ],
    "ssh_username": "{{user `ssh_name`}}",
    "ssh_password": "{{user `ssh_pass`}}",
    "ssh_wait_timeout": "10000s",
    "disk_size": "{{user `disk_size`}}",

    // Parallels Specific
    // ------------------

    "guest_os_type": "debian",
    "parallels_tools_flavor": "lin",
    "hard_drive_interface": "ide",
    "prlctl":
      [
        [ "set", "{{.Name}}", "--memsize", "{{user `memory`}}" ],
        [ "set", "{{.Name}}", "--cpus", "{{user `cpus`}}" ],
        [ "set", "{{.Name}}", "--device-set", "hdd0", "--type", "expand", "--size", "{{user `disk_size`}}" ],
      ]
  }
