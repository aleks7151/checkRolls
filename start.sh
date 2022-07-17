apt-get install expect
wget -qO autoClientMassa.sh https://raw.githubusercontent.com/aleks7151/checkRolls/main/autoClientMassa.sh
wget -qO checkRolls.sh https://raw.githubusercontent.com/aleks7151/checkRolls/main/checkRolls.sh
chmod +x autoClientMassa.sh
chmod +x checkRolls.sh
(crontab -l 2>/dev/null; echo "##CheckRolls"; echo "*/30 * * * * bash $HOME/checkRolls.sh | tee -a $HOME/logCron.txt") | crontab -
