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

## Add user to a group

This is used for `sudo` and `docker` groups

```
usermod -aG $group $user
```

## Booting from grub>

Just in case grub shows you the console instead of execute the kernel. Here is how to fix it. 

```
# Invokes the pager, for paging long command outputs:
grub> set pager=1
# List all your hard drives and partitions and find your partition containing your /boot.
grub> ls
(hd0) (hd0,gpt2) (hd0,gpt1)
grub> ls (hd0,gpt1)/
boot/ ...
```

Now the part for executing a specified kernel.

```
grub> set root=(hd0,gpt1)
# You should match the id of your partition with the name e.g gpt1 => sda1
grub> linux /boot/vmlinuz-6.1.0-9-amd64 root=/dev/sda1
# Take the same version for vmlinux and initrd !
grub> initrd /boot/initrd.img-6.1.0-9-amd64
grub> boot
```

Your OS should boot now but it's not finished! You must write all your changes to your boot sector of your hard drive.

```
# update-grub
Generating grub configuration file ...
# grub-install /dev/sda
Installing for ...
Installation finished. No error reported
```