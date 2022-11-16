# config
edit sshd file:

```
vim /etc/pam.d/sshd
```

add this line to end sshd file:

```
# SSH Alert script
session required pam_exec.so /etc/pam.scripts/ssh_alert.sh
```



# Create /etc/pam.scripts/ssh_alert.sh
Put the ssh_alert.sh script in this file


# Restart SSH Service

```
service sshd restart
service sshd status
```
