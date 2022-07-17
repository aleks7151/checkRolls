#!/usr/bin/expect -f
set HOME [lindex $argv 0]
set pass [lindex $argv 1]
set command [lindex $argv 2]
set massa_wallet_address [lindex $argv 3]
cd $HOME/massa/massa-client/
spawn ./massa-client $command $massa_wallet_address 1 0
expect -exact "\rEnter wallet password: "
send -- "$pass\r"
expect eof
