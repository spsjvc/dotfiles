DEVICE_ID=$(xinput | grep -i 'touchpad' | grep -oP 'id=\K\d+')

# Set acceleration speed
xinput set-prop $DEVICE_ID "libinput Accel Speed" 0.9

# Enable two-finger right click
xinput set-prop $DEVICE_ID "libinput Click Method Enabled" 0 1

# Enable natural scrolling
xinput set-prop $DEVICE_ID "libinput Natural Scrolling Enabled" 1

