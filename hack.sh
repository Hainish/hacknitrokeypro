#!/bin/bash
if [ "$UID" != "0" ]; then
	echo "Re-run script as root"
	exit 1
fi

if [ ! -x "$1" ] || [ ! -f "$1" ]; then
	echo "Usage: $0 PATH_TO_NITROKEY_HOTP_VERIFICATION"
	exit 1
fi

gpg-connect-agent < nitrokey-reset.txt
$1 set GEZDGNBVGY3TQOJQGEZDGNBVGY3TQOJQ 12345678
$1 check 755224
