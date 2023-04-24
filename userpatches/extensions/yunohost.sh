function post_customize_image__yunohost_version() {
  # Get the yunohost version for naming the .img
  echo "Extracting Yunohost version"
  apt-cache policy yunohost | grep -Po 'Installed: \K.+' > $SRC/output/yunohost_version
}

function pre_update_initramfs__disable_tmp_in_ram() { 
  echo "Disabling /tmp in RAM in step pre_update_initramfs"
  sed '/^tmpfs \/tmp/d' $MOUNT/etc/fstab -i
}
