# Scripting

DON'T Forget To Define The Script and Log Output Paths Before Running the Below Commands. 

### zenigma.sh, is a shell script which append "Hello Zenigma!" for every 15 seconds into a temp file named as “zenigma.log”.

### If you need too run the shell script as a daemon process,

    #make script executable
    chmod +x zenigma.sh 
    nohup ./zenigma.sh > zenigma.out 2>&1 &
    
### Or, you can add zenigma.sh to /etc/systemd/system to run it as a service, 

    #make script executable
    chmod +x zenigma.sh 
    #copy service file to, Linux system directory.
    cp /path/zenigma.service /etc/systemd/system 
    #if you want it to start on the boot.
    systemctl enable zenigma.service 
    systemctl start zenigma.service 


### record_counter.sh, will count records and when it reaches to 20, will delete the previous records,

    #make script executable also need to x zenigma.sh since it included inside of counter.sh
    chmod +x record_counter.sh 
    nohup ./record_counter.sh > record_counter.out 2>&1 &


### Instead of constantly running this script as a daemon or service, we will be using crontab to schedule it with 5 mins of periods, and log the activities such as time, line count, and file deletion status.

    #make script executable also need to x zenigma.sh since it included inside of counter.sh
    chmod +x counter_with_logging.sh
    #run the below command to schecule a cronjob, or manually add it to cron file with crontab -e
    echo "*/5 * * * * /record_counter.sh" | crontab - 
