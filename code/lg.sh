#!/bin/bash
echo  "========== XU002 =========="
ssh XU002 "cd /opt/module/applog/; nohup java -jar gmall-remake-mock-2023-05-15-3.jar $1 $2 $3 >/dev/null 2>&1 &"
echo  "========== XU003 =========="
ssh XU003 "cd /opt/module/applog/; nohup java -jar gmall-remake-mock-2023-05-15-3.jar $1 $2 $3 >/dev/null 2>&1 &"
