# SSH Login Alert Script

This is a bash script that sends an alert to a Rocket.Chat webhook when someone logs into your SSH server.

## Installation

1. Copy the `ssh_alert.sh` script to your server.
2. Make the script executable: `chmod +x ssh_alert.sh`
3. Edit the `webhook_url` variable in the script to match your Rocket.Chat webhook URL.
4. Configure and enable the script in `/etc/pam.d/sshd`. See below for instructions.

## Configuration

1. Open `/etc/pam.d/sshd` in a text editor.
2. Add the following line at the end of the file: `session required pam_exec.so /path/to/ssh_login_alert.sh`

```
session required pam_exec.so /path/to/ssh_alert.sh
```
   - Replace `/path/to/` with the actual path to the script.
3. Save and close the file.

4. Restart SSH Service

```
service sshd restart
service sshd status
```

## Usage

When someone logs into your SSH server, the script will send an alert to the Rocket.Chat webhook.

The alert will include the following information:
- Username
- IP address
- Date and time

## Security Considerations

This script logs sensitive information, such as usernames and IP addresses. Make sure to protect the script and the log file from unauthorized access.

Consider using HTTPS for your Rocket.Chat webhook URL to encrypt the data in transit.

## License

[MIT](https://choosealicense.com/licenses/mit/) 
This project is licensed under the MIT License.

## Credits

This project was created by My User (mrm.elec@email.com)

[![LinkedIn](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/mohamad-reza-moghadasi-5755b959/)](https://www.linkedin.com/in/mohamad-reza-moghadasi-5755b959/) [![Gmail](https://img.shields.io/badge/-Gmail-red?style=flat-square&logo=Gmail&logoColor=white&link=mailto:mrm.elec@gmail.com)](mailto:mrm.elec@gmail.com)
