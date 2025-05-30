#!/usr/bin/env sh

# Check `bluetoothctl gatt.list-attributes` to find paths for `Battery Level`

# bluetoothctl gatt.list-attributes | ag "Battery Level" -B3
# Characteristic (Handle 0x0011)
#         /org/bluez/hci0/*********************/service0010/char0011
#         ********-****-****-****-************
#         Battery Level

MAC_ADDR=*****************
L_KB_PATH=service0010/char0011
R_KB_PATH=service0015/char0016

L_KB_HEX=$(gdbus call --system --dest org.bluez --object-path /org/bluez/hci0/dev_$MAC_ADDR/$L_KB_PATH --method org.bluez.GattCharacteristic1.ReadValue "{}" | sed -E 's/.*0x([0-9a-fA-F]+).*/\1/')
R_KB_HEX=$(gdbus call --system --dest org.bluez --object-path /org/bluez/hci0/dev_$MAC_ADDR/$R_KB_PATH --method org.bluez.GattCharacteristic1.ReadValue "{}" | sed -E 's/.*0x([0-9a-fA-F]+).*/\1/')

# echo "Left: $((16#$L_KB_HEX))%; Right: $((16#$R_KB_HEX))%"
echo "Left: $((16#$L_KB_HEX))%; Right: $((16#$R_KB_HEX))%"
