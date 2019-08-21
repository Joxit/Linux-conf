# OPS Cheat sheet

## Create temporary swapfile

```sh
SIZE=1G
SWAPFILE=/tmp/swapfile
# Allocate the swap for $SIZE
sudo fallocate -l $SIZE $SWAPFILE
# Create swap
sudo mkswap $SWAPFILE
# Change rights for r/w for user only
sudo chmod 0600 $SWAPFILE
# Enable swap
sudo swapon $SWAPFILE
```

```sh
# Disable swap
sudo swapoff $SWAPFILE
```

## Resize linux partition

1.  Install `e2fsprogs`
2.  Check your disk with `fdisk -l`
3.  Check your file system with `e2fsck -f /dev/{disk}`
4.  Resize your disk partition with `resize2fs /dev/{disk}`

## Crypto Disk

After formatting your disk with `gnome-disks` for example and installing `cryptmount` and `cryptsetup`.

1. Create your crypt device mapper. Open the file `/etc/crypttab` and add a line for your device.
```
# <target name>	<source device>		<key file>	<options>
# This will name your crypt partition, which is located in /dev/sda4, home.
home	/dev/sda4	none	luks,retry=1
```
2. Now you can update your fstab with the newly named file system `/dev/mapper/home`.
```
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
/dev/mapper/home	/home	ext4 defaults 0 2
```
3. Restart your computer