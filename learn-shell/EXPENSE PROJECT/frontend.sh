source COMMON.sh
component=frontend

echo Installing nginx
dnf install nginx -y &>>$log_file

echo removing old nginx content
rm -rf /usr/share/nginx/html/* &>>$log_file

echo keeping expense config file in nginx
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file

cd /usr/share/nginx/html

download_and_extract

echo starting nginx server
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file
