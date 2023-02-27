# Scripting

zenigma.sh, is a shell script which append "Hello Zenigma!" for every 15 seconds into a temp file named as “zenigma.log”.

If you need to run the script on the background, you can add zenigma.sh to /etc/systemd/system to run it as a service, 

    chmod +x /path/zenigma.sh #make script executable
    cp /path/zenigma.service /etc/systemd/system #copy service file to, Linux system directory.
    systemctl enable zenigma.service #if you want it to start on the boot.
    systemctl start zenigma.service
    
Or to run the shell script as a daemon process,

    nohup ./zenigma.sh > zenigma.out 2>&1 &

