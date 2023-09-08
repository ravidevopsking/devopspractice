curl -sL https://rpm.nodesource.com/setup_lts.x | bash
dnf install nodejs -y
useradd expense
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cp backend.service /etc/systemd/system/backend.service
cd /app
unzip /tmp/backend.zip
npm install
systemctl daemon-reload
systemctl enable backend
systemctl start backend
dnf install mysql -y
mysql -h 172.31.46.91 -uroot -pExpenseApp@1 < /app/schema/backend.sql
#sqlserver privateip i.e mysql.raviskingdom.online
