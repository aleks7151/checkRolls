massa_password=`cat .bash_profile | grep massa_password | grep -Eo '\".*+\"$'`
massa_password=`echo $massa_password | awk '{print substr($0, 2, length($0) - 2)}'`

roll=`./autoClientMassa.sh $HOME $massa_password wallet_info | grep "Final rolls" | awk '{print $3}' | grep -Eo '[[:digit:]]+'`
if [ "$roll" -eq "0" ]
then
        massa_wallet_address=`./autoClientMassa.sh $HOME $massa_password wallet_info | grep 'Address'| awk '{print $2}' | grep -Eo '^[a-Z|0-9]+'`
	./autoClientMassa.sh $HOME $massa_password buy_rolls $massa_wallet_address
        echo "`date`	Final rolls = 0"
else
        echo "`date`	All Okey ;)"
fi
