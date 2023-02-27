# Scripting

zenigma.sh, is a shell script which append "Hello Zenigma!" for every 15 seconds into a temp file named as “zenigma.log”.





If you need too run the shell script as a daemon process,

    chmod +x /path/zenigma.sh #make script executable
    nohup ./zenigma.sh > zenigma.out 2>&1 &
    
Or, you can add zenigma.sh to /etc/systemd/system to run it as a service, 

    chmod +x /path/zenigma.sh #make script executable
    cp /path/zenigma.service /etc/systemd/system #copy service file to, Linux system directory.
    systemctl enable zenigma.service #if you want it to start on the boot.
    systemctl start zenigma.service
    
    
    
    

record_counter.sh, will count records and when it reaches to 20, will delete the previous records,
    
    chmod +x /path/record_counter.sh #make script executable
    nohup ./record_counter.sh > record_counter.out 2>&1 &
    
    
    
    
    
counter_with_logging.sh will do the same with above script but, will be logging the activities such as time, line count, and file deletion status.
    
Instead of constantly running this script as a daemon or service, we will be using crontab to schedule it with 5 mins of periods.  

    chmod +x /path/record_counter.sh #make script executable
    crontab -e 
    */5 * * * * /path/counter_with_logging.sh #add this to the cron file than save it
    
