# Scripting

zenigma.sh, is a shell script which append "Hello Zenigma!" for every 15 seconds into a temp file named as “zenigma.log”.

If you need to run the script on the background, you can add zenigma.sh to /etc/systemd/system to run it as a service, you can use nohup,

    nohup ./zenigma.sh > zenigma.out 2>&1 &

