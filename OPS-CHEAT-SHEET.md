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