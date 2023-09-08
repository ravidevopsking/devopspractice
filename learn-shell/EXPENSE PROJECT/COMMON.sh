#Note: This file content will be imported to other files as source common.sh
log_file=/tmp/expense.log     #all log files aare stored to /tmp/expense.log


#creating common function, this function will import to other files and access by calling download_and_extract
download_and_extract() {
  echo Download $component Code
  curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >>$log_file
  echo $?

  echo Extracting $component Code
  unzip /tmp/$component.zip >>$log_file
  echo $?
}