## Nvidia-smi_undetected_kernel
If you install CUDA and and NVIDIA drivers proprietary still problem persist watch the tutorial and understand the secure boot working with 3rd party packages.

## Reason It does'nt work with secure boot!
1. Nvidia-smi only works with proprietary NVIDIA drivers, not the open kernel (nouveau-like) ones
2. Secure Boot will block unsigned proprietary modules unless you enroll a Machine Owner Key (MOK).

## Answer to solve this querry!
1. Dissable your secure boot system.
2. Create your mok.key so that the key will be verified as user key and enable the kernel to communicate with the driver properly also update the driver to recommended settings or latest version.
