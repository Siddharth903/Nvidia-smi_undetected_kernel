1. Check GPU & Current Driver


lspci | grep -i nvidia
nvidia-smi
```

If `nvidia-smi` fails → driver not loaded properly.



 2. Purge Old/Conflicting Drivers

```
sudo apt --purge remove nvidia-a
sudo apt autoremove
```

Reboot after purge:

```
sudo reboot


 3. Disable Nouveau (Default Open-Source Driver)

Create config file:


         sudo nano /etc/modprobe.d/blacklist-nouveau.conf


     Add:

                blacklist nouveau
                options nouveau modeset=0


#Then update initramfs:


sudo update-initramfs -u



 4. Install NVIDIA Drivers (Official)

Find recommended driver:


ubuntu-drivers devices


Install:


sudo apt install nvidia-driver-XXX


(Replace `XXX` with recommended version, e.g., `550`.)

Reboot:


sudo reboot




 5. Fix Secure Boot Issues (If Enabled)

If your system uses aaSecure Bootaa, the NVIDIA kernel module won’t load unless signed.

1. During installation, Ubuntu may prompt you to aaset a MOK passwordaa.
2. On reboot, enter BIOS screen → aaEnroll MOKaa → type the password you set.

If not done, you may need to manually sign the module:


sudo mokutil --import /var/lib/shim-signed/mok/MOK.der


Reboot and enroll key.



 6. Verify Installation

nvidia-smi
nvcc --version    if CUDA installed


Expected:

a GPU details show up in `nvidia-smi`.
a No “driver not loaded” errors.



 7. Common Debug Commands

a Check kernel logs:


dmesg | grep -i nvidia


a Check loaded modules:


lsmod | grep nvidia

a Reinstall drivers if upgrade breaks:


sudo apt reinstall nvidia-driver-XXX
